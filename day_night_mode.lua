--      day_night_mode.lua
--      shift+L for alternate IR light on keypress
--      Link: https://github.com/ruirigel/mpv-scripts

-- Start config
-- Array with all rtsp address of ipcams for streaming video and control functions.
local ipcams = {
   {
       name = "ipcam01",
       full_address = "rtsp://login:pass@address:551/stream2",
       address = "address",
       username = "login",
       password = "pass",
       video_port = "551",
       func_port = "541"
   },
   {
       name = "ipcam02",
       full_address = "rtsp://login:pass@address:552/stream2",
       address = "address",
       username = "login",
       password = "pass",
       video_port = "552",
       func_port = "542"
   },
   {
       name = "ipcam03",
       full_address = "rtsp://login:pass@address:553/stream2",
       address = "address",
       username = "login",
       password = "pass",
       video_port = "553",
       func_port = "543"
   }
}
-- End Config

local mp = require "mp"
local msg = require "mp.msg"
local utils = require "mp.utils"
local options = require 'mp.options'

state = 1
arg = "auto"

local opts = {
       ir_light = 'L'
}

options.read_options(opts)

-- In this case we can have multiple mpv clients open to reproduce and control multiple ipcameras. That func search in array-
-- for the address is currently playing, if address exists take the data from it to create and run python that communicate-
-- with the ipcameras. In this specific case change the state day night mode.
function day_night_mode()
        local uri = mp.get_property("path")
        for index, data in ipairs(ipcams) do
            if uri == data.full_address then
                if state == 1 then
                    state = 0
                    arg = "off"       
                else
                    state = 1
                    arg = "on"
                end
                local file = io.open("script.py", "w+")
                file:write("#!/usr/bin/env python3", "\n")
                file:write("import sys", "\n")
                file:write("from pytapo import Tapo", "\n")
                file:write("arg = sys.argv[1]", "\n")
                file:write('user = "'..data.username..'"', '\n')
                file:write('password = "'..data.password..'"','\n')
                file:write('host = "'..data.address..':'..data.func_port..'"', '\n')
                file:write("tapo = Tapo(host, user, password)", "\n")
                file:write("tapo.setDayNightMode(arg)", "\n")
                file:close()
                mp.msg.info(string.format("Change day night mode "))
                mp.osd_message(string.format("Change day night mode "))
                mp.commandv("run", "python3", "script.py", arg)
            end
        end
end

mp.add_forced_key_binding(opts.ir_light, "day_night_mode", day_night_mode)

