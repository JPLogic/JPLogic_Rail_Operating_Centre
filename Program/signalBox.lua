--Signalbox Executable
--Vars
local title = "Signal Box Server"
local signalBox = "JPLogic Central"
local locationName = "Platform 1"
local signalBoxID = 6
local data = {}
local trainInfo = {}
local response = false

--Startup
local SignalCableSide = "top"
local rednetSide = "back"
local PointCableSide = "bottom"
rednet.open(rednetSide)
os.loadAPI("Data/background")
shell.run("Data/background")

--Functions
local function waitMessage()
  id, message, proto = rednet.receive()
  if proto == "(something)" then
    -- Do stuff
  elseif proto == "(something else)" then
    -- Do stuff
  else
    sleep(0.2)
  end
end

local function waitKey()
  event, key = os.pullEvent("char")
  if key == keys.(a key) then
    -- Do stuff
  elseif key == keys.(a key) then
    -- Do stuff
  else
  end
end
  



end

--Main
while true do
parallel.waitForAny(waitMessage(),waitKey(),OStime())
end

