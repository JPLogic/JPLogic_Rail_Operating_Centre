--Signalbox Executable
--Vars - These will be ref from Config File
local title = "Signal Box Server"
local signalBox = "JPLogic Central"
local signalBoxID = 6
local data = {}
local trainInfo = {}
local response = false
local adminpassword = "test"
local SignalCableSide = "top"
local rednetSide = "back"
local PointCableSide = "bottom"
local RanLength = 20
local RanLengthe = ""
--Runs
os.loadAPI("Data/background")
shell.run("Data/background")

--Tables
all  = "0987654321ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz")
--Functions
local function setPWord()
  for i = 1, tonumber(RanLength) do
    r = math.random(#all)
    Ranlengthe = RanLengthe.. string.sub(all,r,r)
  end
ranPWord = RanLengthe
end
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
  elseif key == keys.r then
    print("Key: R, has been pressed: Rebooting Terminal")
    print("Do you want ALL terminals in Signal Box area to reboot?")
    allr = read()
    if allr = "y" then
      print("Instructing all terminals to reboot...standby")
      print("This terminal will reboot in a moment")
      proto = signalBox.." Reboot"
      for i,v in pairs(allPC) do
        idPC = v
        namePC = i
        rednet.send(v,ranPWord,proto)
        print("Terminal: "..i.." instructed to reboot")
      end
      print("All terminals instructed to reboot - Rebooting")
      sleep(0.2)
      os.reboot()
    elseif allr = "n" then
      print("Rebooting this terminal, all others remain online...")
      sleep(0.2)
      os.reboot()
    else
      print("Invalid response, Reboot request cancelled!")
      sleep(0.2)
      break
    end
  else
  end
end
  



end


--Initial Startup
print("Initializing session..")
setPword()
print("Random password set..")
print("Contacting assets..")
rednet.open(rednetSide)
proto = signalBox.." Heartbeat")
rednet.broadcast(ranPWord,proto)
--Main
while true do
parallel.waitForAny(waitMessage(),waitKey(),OStime())
end

