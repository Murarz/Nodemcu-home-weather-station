
-- Main Program 
  -- Data send
function datasend()
conn = net.createConnection(net.TCP, 0)
conn:on("connection", function(sck)
  sck:send("GET /esp.php?temp=" .. temp .. " HTTP/1.1\r\nHost: temperatura-wykres.cba.pl\r\nConnection: keep-alive\r\nAccept: */*\r\n\r\n")
  print(sck:getpeer())
end)
conn:connect(80, "temperatura-wykres.cba.pl")

conn:on("sent",function(conn)
conn:close()
end)

end

tmr.alarm(1, 10000, 1, function() 
temp = adc.read(0)
str3 = temp
print_OLED()
print(temp)
datasend()
end ) 
