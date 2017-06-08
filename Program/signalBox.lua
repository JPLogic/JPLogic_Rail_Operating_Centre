--Signalbox Executable
--Vars - These will be ref from Config File
local title = "Signal Box Server"
local signalBox = "JPLogic Central"
local locationName = "Platform 1"
local signalBoxID = 6
local data = {}
local trainInfo = {}
local response = false
local adminpassword = "test"
--Startup
local SignalCableSide = "top"
local rednetSide = "back"
local PointCableSide = "bottom"
rednet.open(rednetSide)
--Runs
os.loadAPI("Data/background")
shell.run("Data/background")

--Functions
local function waitMessage()
  id, message, proto = rednet.receive()
  if proto == "stationStop" then
    shell.run("Data/timetables")
    data = textutils.unserialize(message)
    RLocation = data.Location
    UID = data.UID
    sentTime = data.Time
    for i,v in pairs(UIDs)
      if v == UID then
        hCode = i
      else
      end
    end
    if hCode == "" then
      print("No assigned timetable for"..UID.."!")
    else
      print("Train: "..UID.." is "..hCode.."!")
    end
    for i,v in pairs(hCode) do
      if i == signalBox then
        if table[hCode].signalBox.Location == RLocation then
          ttLocation = table[hCode].signalBox.Location
          ttArr = table[hCode].signalBox.Location.Data.Arr
          ttDep = table[hCode].signalBox.Location.Data.Dep
          ttExit = table[hCode].signalBox.Location.Data.Exit
        else
        end
      else
      end
    end
  elseif proto == "Checkpoint" then
    -- Do stuff
  else
    sleep(0.2)
  end
end

local function waitKey()
  event, key = os.pullEvent("char")
  if key == keys.t then
    print("Key: T, has been pressed: Terminating Program")
    print("Confirm you want to Terminate "..signalBox.." "..title.."?")
    confirm = read()
    if confirm == "" then
      print("Termination request cancelled!")
    elseif confirm == adminpassword then
      print("Password: Correct - Terminating")
      sleep(0.5)
      break
    else
      print("Invalid entry!")
      print("Termination request cancelled!")
    end
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

