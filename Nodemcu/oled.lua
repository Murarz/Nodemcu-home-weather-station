-- OLED Display demo
-- March, 2016 
-- @kayakpete | pete@hoffswell.com
-- Hardware: 
--   ESP-12E Devkit
--   4 pin I2C OLED 128x64 Display Module
-- Connections:
--   ESP  --  OLED
--   3v3  --  VCC
--   GND  --  GND
--   D1   --  SDA
--   D2   --  SCL
-- Variables 
sda = 5 -- SDA Pin
scl = 6 -- SCL Pin
function init_OLED(sda,scl) --Set up the u8glib lib
   sla = 0x3C
   i2c.setup(0, sda, scl, i2c.SLOW)
   disp = u8g.ssd1306_128x64_i2c(sla)
   disp:setFont(u8g.font_6x10)
   disp:setFontRefHeightExtendedText()
   disp:setDefaultForegroundColor()
   disp:setFontPosTop()
   --disp:setRot180()           -- Rotate Display if needed
end

-- oled display
 str1 = " "
 str2 = " "
 str3 = " "
function print_OLED()
 disp:firstPage()
 repeat
   disp:drawFrame(2,2,126,62)
   disp:setFont(u8g.font_6x10)
   disp:drawStr(5, 13, str1)
   disp:drawStr(5, 23, str2)
   disp:setFont(u8g.font_10x20)
   disp:drawStr(50, 50, str3)
 until disp:nextPage() == false
end
-- Init 
init_OLED(sda,scl)
print_OLED()
