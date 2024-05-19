--[[
    init.lua
    Created: 08/24/2023 20:04:21
    Description: Autogenerated script file for the map end_ambush_forest.
]]--
-- Commonly included lua functions and data
require 'origin.common'

-- Package name
local end_ambush_forest = {}

-- Local, localized strings table
-- Use this to display the named strings you added in the strings files for the map!
-- Ex:
--      local localizedstring = MapStrings['SomeStringName']
local MapStrings = {}

-------------------------------
-- Map Callbacks
-------------------------------
---end_ambush_forest.Init(map)
--Engine callback function
function end_ambush_forest.Init(map)

  --This will fill the localized strings table automatically based on the locale the game is 
  -- currently in. You can use the MapStrings table after this line!
  MapStrings = COMMON.AutoLoadLocalizedStrings()

end

---end_ambush_forest.Enter(map)
--Engine callback function
function end_ambush_forest.Enter(map)

  if SV.ambush_forest.BossPhase == 4 then
    end_ambush_forest.EmptyReturn()
  elseif SV.ambush_forest.BossPhase == 3 then
    end_ambush_forest.PostBattle()
  elseif SV.ambush_forest.BossPhase == 1 then
    end_ambush_forest.PreBattle(true)
  else
    end_ambush_forest.PreBattle(false)
  end
end



function end_ambush_forest.PreBattle(shortened)

  local player = CH("PLAYER")
  local enemy = CH("Honchkrow")
  
  GAME:CutsceneMode(true)
  
  GAME:MoveCamera(204, 192, 1, false)
  
  GROUND:Unhide("Honchkrow")
  GROUND:Unhide("Murkrow_1")
  GROUND:Unhide("Murkrow_2")
  
  
  
  UI:WaitShowTitle(GAME:GetCurrentGround().Name:ToLocal(), 20)
  GAME:WaitFrames(30)
  UI:WaitHideTitle(20)
  
  GAME:FadeIn(20)
  GROUND:MoveToPosition(player, 196, 240, false, 2)
  
  if shortened == false then
  
    UI:SetSpeaker(enemy)
    UI:WaitShowDialogue(STRINGS:Format(MapStrings['Expo_Cutscene_Line_001']))
    
    SOUND:PlayBGM("A13. Threat.ogg", false)
    
    UI:WaitShowDialogue(STRINGS:Format(MapStrings['Expo_Cutscene_Line_002']))
    UI:WaitShowDialogue(STRINGS:Format(MapStrings['Expo_Cutscene_Line_003']))
    
    --also, if the player has already reached the summit, give a reaction
  
  else
    SOUND:PlayBGM("A13. Threat.ogg", false)
    UI:WaitShowDialogue(STRINGS:Format(MapStrings['Expo_Cutscene_Short']))
  end
  
  
  
  SOUND:PlayBGM("C02. Boss Battle 2.ogg", false)
  
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Expo_Cutscene_Line_004']))
  
  GAME:WaitFrames(30)
  
  COMMON.BossTransition(true)
  
  GAME:CutsceneMode(false)
  
  GAME:ContinueDungeon('ambush_forest', 3, 0, 0)
  
end


function end_ambush_forest.PostBattle()

  local player = CH("PLAYER")
  local enemy = CH("Honchkrow")
  
  GAME:CutsceneMode(true)
  
  GROUND:Unhide("Honchkrow")
  GROUND:Unhide("Murkrow_1")
  GROUND:Unhide("Murkrow_2")
  
  GAME:MoveCamera(204, 192, 1, false)
  
  GROUND:TeleportTo(player, 196, 240, Direction.Up)
  
  GAME:FadeIn(20)
  
  GAME:WaitFrames(60)
  
  UI:SetSpeaker(enemy)
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Ending_Cutscene_Line_001']))
  
  GAME:FadeOut(false, 20)
  
  GAME:CutsceneMode(false)
  
  SV.ambush_forest.BossPhase = 4
  COMMON.EndDungeonDay(RogueEssence.Data.GameProgress.ResultType.Cleared, 'guildmaster_island', -1, 3, 0)
  
end

function end_ambush_forest.EmptyReturn()

  local player = CH("PLAYER")
  local enemy = CH("Honchkrow")
  
  GAME:CutsceneMode(true)
  
  UI:WaitShowTitle(GAME:GetCurrentGround().Name:ToLocal(), 20)
  GAME:WaitFrames(30)
  UI:WaitHideTitle(20)
    
  GAME:MoveCamera(204, 192, 1, false)
  
  GAME:FadeIn(20)
  
  GAME:WaitFrames(60)
  
  GROUND:MoveToPosition(player, 196, 240, false, 2)
  
  UI:ResetSpeaker(false)
  UI:SetCenter(true)
  
  STRINGS:Format(RogueEssence.StringKey("DLG_DUNGEON_DEAD_END"):ToLocal())
  
  GAME:FadeOut(false, 20)
  
  GAME:CutsceneMode(false)
  
  COMMON.EndDungeonDay(RogueEssence.Data.GameProgress.ResultType.Cleared, 'guildmaster_island', -1, 3, 0)
  
end


---end_ambush_forest.Exit(map)
--Engine callback function
function end_ambush_forest.Exit(map)


end

---end_ambush_forest.Update(map)
--Engine callback function
function end_ambush_forest.Update(map)


end

---end_ambush_forest.GameSave(map)
--Engine callback function
function end_ambush_forest.GameSave(map)


end

---end_ambush_forest.GameLoad(map)
--Engine callback function
function end_ambush_forest.GameLoad(map)

  GAME:FadeIn(20)

end

-------------------------------
-- Entities Callbacks
-------------------------------


return end_ambush_forest
