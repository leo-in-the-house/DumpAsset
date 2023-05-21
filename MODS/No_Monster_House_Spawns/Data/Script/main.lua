--[[
  main.lua
  
  This file is loaded persistently.
  Its main purpose is to include anything that needs to stay persistently in the lua state.
  Things like services.
]]--

--------------------------------------------------------------------------------------------------------------
-- Service Packages
--------------------------------------------------------------------------------------------------------------
require 'services.chatter'
require 'services.debug_tools'
require 'services.no_monster_house_spawns'

math.randomseed(os.time())