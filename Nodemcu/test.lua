
-- check connection
do
gpio.mode(0, gpio.OUTPUT)
gpio.write(0, gpio.HIGH)
  local fail_numbers = 0
  local blinking = tmr.create()
  local a = true
 blinking:register(300, 1, function() if a == true then gpio.write(0, gpio.LOW) a = false else gpio.write(0, gpio.HIGH) a = true end end)

 wifi.eventmon.register(wifi.eventmon.STA_DISCONNECTED, function(T)
 fail_numbers = fail_numbers + 1 blinking:start()
 if fail_numbers > 20 then node.restart() end
 print("\n\tSTA - DISCONNECTED")
 str1 = "STA - DISCONNECTED"
 str2 = " "
 print_OLED()
 end)

 wifi.eventmon.register(wifi.eventmon.STA_CONNECTED, function(T)
 fail_numbers = 0 blinking:stop() gpio.write(0, gpio.HIGH)
 print("\n\tSTA - CONNECTED".."\n\tSSID: "..T.SSID )
 str1 = "STA - CONNECTED"
 str2 = T.SSID
 print_OLED()
 end)

 end

-- config wifi

enduser_setup.start(
  function()
    print("Connected to wifi as:" .. wifi.sta.getip())
local def_sta_config=wifi.sta.getconfig(true)
    str1 = "STA - CONNECTED"
    str2 = def_sta_config.ssid
    print_OLED()
    dofile("tcp.lua")
  end,
  function(err, str)
    print("enduser_setup: Err #" .. err .. ": " .. str)
  end )


