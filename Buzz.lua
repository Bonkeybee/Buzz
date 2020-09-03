local ADDON_NAME = ...
BUZZ = LibStub("AceAddon-3.0"):NewAddon(ADDON_NAME, "AceTimer-3.0")
BUZZ.VERSION = GetAddOnMetadata(ADDON_NAME, "Version")

local MAX_DELAY = 0.25
function BUZZ:quack()
  PlaySoundFile("Interface\\AddOns\\Buzz\\Sounds\\quack.ogg", "Master")
end
local SUPPORTED = {"quack"}

local function getEmote(message)
  for _, v in pairs(SUPPORTED) do
    if (strfind(message, v)) then
      return v
    end
  end
end

local function onEvent(_, event, message)
  if (event == "CHAT_MSG_EMOTE") then
    if (not message) then
      return
    end

    local emote = getEmote(strlower(message))
    if (emote) then
      local delay = random() * MAX_DELAY
      BUZZ:ScheduleTimer(emote, delay)
    end
  end
end

SLASH_QUACK1 = "/quack"
SlashCmdList["QUACK"] = function()
  if (UnitExists("target")) then
    SendChatMessage("quacks at %t. Quack!", "EMOTE")
  else
    SendChatMessage("quacks at everyone. Quack!", "EMOTE")
  end
end

BUZZ.FRAME = CreateFrame("Frame")
BUZZ.FRAME:RegisterEvent("CHAT_MSG_EMOTE")
BUZZ.FRAME:SetScript("OnEvent", onEvent)
