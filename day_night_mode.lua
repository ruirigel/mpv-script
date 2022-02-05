--      day_night_mode.lua
--      'shift+l' alternate IR light on keypress;                     keybind name: "show_day_night_mode"
--      Link: https://github.com/ruirigel/mpv-scripts


options = require 'mp.options'
state = 1
arg = "auto"

local opts = {
       ir_light = 'L'
}

options.read_options(opts)

function show_day_night_mode()

        if state == 1 then
                state = 0
                arg = "off"
        else
                state = 1
                arg = "on"
        end

        mp.msg.info(string.format("Change IR light mode"))
        mp.osd_message(string.format("Change IR Light mode"))
        mp.commandv("run", "python3", "/home/x/Desktop/aosripcamstapo.py", arg)

end

mp.add_forced_key_binding(opts.ir_light, "show_day_night_mode", show_day_night_mode)
