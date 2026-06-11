-- ttd.lua
-- Per-enemy time-to-die ledger for ConROC.
-- Hekili-inspired: tracks observed HP-over-time per GUID so the rotation
-- can ask "how many of these mobs will still be alive in N seconds?"
-- rather than just "how many nameplates are showing?".

ConROC.TTD = ConROC.TTD or {};
local TTD = ConROC.TTD;

TTD.enemies = {};

-- Tuning
local SAMPLE_WINDOW  = 10    -- max HP samples retained per enemy
local MIN_SAMPLES    = 3     -- before TTD is treated as meaningful
local POLL_INTERVAL  = 0.5   -- seconds between full polls
local STALE_TIMEOUT  = 5     -- drop an enemy after this many seconds without an update

local GetTime                   = GetTime
local UnitGUID                  = UnitGUID
local UnitHealth                = UnitHealth
local UnitHealthMax             = UnitHealthMax
local UnitName                  = UnitName
local UnitExists                = UnitExists
local UnitCanAttack             = UnitCanAttack
local UnitIsDead                = UnitIsDead
local UnitClassification        = UnitClassification
local CombatLogGetCurrentEventInfo = CombatLogGetCurrentEventInfo
local wipe   = wipe
local pairs  = pairs
local huge   = math.huge
local insert = table.insert
local remove = table.remove
local format = string.format

-- Add or refresh a sample for the given unitID.
function TTD:Sample(unit)
	if not UnitExists(unit) then return end
	if not UnitCanAttack("player", unit) then return end

	local guid = UnitGUID(unit)
	if not guid then return end

	if UnitIsDead(unit) then
		self.enemies[guid] = nil
		return
	end

	local hp    = UnitHealth(unit)
	local maxHp = UnitHealthMax(unit)
	if maxHp == 0 then return end
	local hpPct = (hp / maxHp) * 100

	local now = GetTime()
	local rec = self.enemies[guid]

	if not rec then
		self.enemies[guid] = {
			name           = UnitName(unit),
			firstSeen      = now,
			lastSeen       = now,
			lastHpPct      = hpPct,
			samples        = { { t = now, hpPct = hpPct } },
			rate           = 0,
			ttd            = huge,
			classification = UnitClassification(unit),
		}
		return
	end

	rec.lastSeen  = now
	rec.lastHpPct = hpPct

	local samples = rec.samples
	if samples[#samples].hpPct ~= hpPct then
		insert(samples, { t = now, hpPct = hpPct })
		if #samples > SAMPLE_WINDOW then
			remove(samples, 1)
		end
	end

	local n = #samples
	if n >= MIN_SAMPLES then
		local first = samples[1]
		local last  = samples[n]
		local dt    = last.t - first.t
		local dhp   = first.hpPct - last.hpPct
		if dt > 0 and dhp > 0 then
			rec.rate = dhp / dt
			rec.ttd  = hpPct / rec.rate
		else
			rec.rate = 0
			rec.ttd  = huge
		end
	end
end

function TTD:Prune()
	local now = GetTime()
	for guid, rec in pairs(self.enemies) do
		if now - rec.lastSeen > STALE_TIMEOUT then
			self.enemies[guid] = nil
		end
	end
end

function TTD:Wipe()
	wipe(self.enemies)
end

function TTD:Poll()
	self:Sample("target")
	self:Sample("focus")
	self:Sample("mouseover")
	for i = 1, 40 do
		self:Sample("nameplate" .. i)
	end
	for i = 1, 5 do
		self:Sample("boss" .. i)
	end
	self:Prune()
	self:UpdateOverlay()
end

-- Lazy-attach a small FontString to the primary icon (ConROCWindow)
-- showing live enemy count + shortest TTD. Returns nil if the icon frame
-- doesn't exist yet (e.g. addon still initialising).
function TTD:GetOverlayFrame()
	if self._overlay then return self._overlay end
	local parent = _G.ConROCWindow
	if not parent then return nil end
	local fs = parent:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
	fs:SetFont("Fonts\\FRIZQT__.TTF", 11, "OUTLINE")
	fs:SetPoint("BOTTOMLEFT", parent, "BOTTOMLEFT", 2, 2)
	fs:SetJustifyH("LEFT")
	fs:SetTextColor(1, 1, 1, 1)
	self._overlay = fs
	return fs
end

function TTD:UpdateOverlay()
	local fs = self:GetOverlayFrame()
	if not fs then return end

	local p = ConROC.db and ConROC.db.profile
	if not (p and p.enableTTDOverlay) then
		fs:SetText("")
		return
	end

	local count = 0
	for _ in pairs(self.enemies) do count = count + 1 end
	if count == 0 then
		fs:SetText("")
		return
	end

	local shortest = ConROC:ShortestTTD()
	local ttdStr = (shortest == huge) and "?" or format("%.1fs", shortest)

	local threshold = p.autoAoEThreshold or 3
	local ttdMin    = p.autoAoEMinTTD    or 0
	local alive     = ConROC:EnemiesAboveTTD(ttdMin)

	if alive >= threshold then
		fs:SetTextColor(1, 0.85, 0.1, 1)
	else
		fs:SetTextColor(1, 1, 1, 1)
	end
	fs:SetText(format("%dx %s", count, ttdStr))
end

-- === Public API surfaced on ConROC ==========================================

-- Lowest TTD across the ledger (or math.huge if no usable estimate yet).
function ConROC:ShortestTTD()
	local m = huge
	for _, r in pairs(TTD.enemies) do
		if r.ttd and r.ttd < m then m = r.ttd end
	end
	return m
end

-- Highest finite TTD across the ledger (or 0 if none).
function ConROC:LongestTTD()
	local m = 0
	for _, r in pairs(TTD.enemies) do
		if r.ttd and r.ttd ~= huge and r.ttd > m then m = r.ttd end
	end
	return m
end

-- Number of enemies expected to live at least `seconds` longer.
-- Enemies without a meaningful TTD estimate (no decay yet) count as alive.
function ConROC:EnemiesAboveTTD(seconds)
	local n = 0
	for _, r in pairs(TTD.enemies) do
		if not r.ttd or r.ttd == huge or r.ttd >= seconds then
			n = n + 1
		end
	end
	return n
end

-- TTD of the current target, or nil if untracked.
function ConROC:TargetTTD()
	local guid = UnitGUID("target")
	if not guid then return nil end
	local r = TTD.enemies[guid]
	return r and r.ttd or nil
end

-- Total tracked enemies, no TTD filter.
function ConROC:TrackedEnemyCount()
	local n = 0
	for _ in pairs(TTD.enemies) do n = n + 1 end
	return n
end

-- === Event frame ===========================================================

local frame = CreateFrame("Frame", "ConROCTTDFrame")
frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
frame:RegisterEvent("PLAYER_REGEN_ENABLED")
frame:RegisterEvent("PLAYER_TARGET_CHANGED")
frame:RegisterEvent("PLAYER_FOCUS_CHANGED")
frame:RegisterEvent("NAME_PLATE_UNIT_ADDED")

frame:SetScript("OnEvent", function(_, event, ...)
	if event == "COMBAT_LOG_EVENT_UNFILTERED" then
		local _, sub, _, _, _, _, _, destGUID = CombatLogGetCurrentEventInfo()
		if destGUID and (sub == "UNIT_DIED" or sub == "UNIT_DESTROYED" or sub == "PARTY_KILL") then
			TTD.enemies[destGUID] = nil
		end
	elseif event == "PLAYER_REGEN_ENABLED" then
		TTD:Wipe()
	elseif event == "PLAYER_TARGET_CHANGED" then
		TTD:Sample("target")
	elseif event == "PLAYER_FOCUS_CHANGED" then
		TTD:Sample("focus")
	elseif event == "NAME_PLATE_UNIT_ADDED" then
		TTD:Sample((...))
	end
end)

local accum = 0
frame:SetScript("OnUpdate", function(_, elapsed)
	accum = accum + elapsed
	if accum >= POLL_INTERVAL then
		accum = 0
		TTD:Poll()
	end
end)
