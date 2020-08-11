QUACKEMOTE_ADDON_NAME, QUACKEMOTE = ...
QUACKEMOTE.VERSION = GetAddOnMetadata(QUACKEMOTE_ADDON_NAME, "Version")

local function onEvent(_, event, arg1)
  if (event == "CHAT_MSG_EMOTE") then
    if (not arg1) then
      return
    end

    if (strfind(strlower(arg1), "quack")) then
      PlaySoundFile("Interface\\AddOns\\QuackEmote\\quack.ogg", "Master")
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

QUACKEMOTE.FRAME = CreateFrame("Frame")
QUACKEMOTE.FRAME:RegisterEvent("CHAT_MSG_EMOTE")
QUACKEMOTE.FRAME:SetScript("OnEvent", onEvent)
