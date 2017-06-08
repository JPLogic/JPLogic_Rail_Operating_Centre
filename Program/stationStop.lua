--Vars
local title = "Station Stop Manager"
local signalBox = "JPLogic Central"
local locationName = "Platform 1"
local signalBoxID = 6
local data = {}
local trainInfo = {}
local response = false

--Startup
local stopBlock = "top"
local rednetSide = "back"
local signalBlock = "bottom"
local rfid = peripheral.wrap("right")
rednet.open(rednetSide)
os.loadAPI("Data/background")
shell.run("Data/background")

--Functions
function waitTrain()
  rfid.scan(2)
  event, arg1, arg2, arg3, arg4 = os.pullEvent()
    if event == "rfid_detected" then
      UID = arg1
      timestamp = textutils.formatTime(os.time(),true)
      print("Train: "..UID.." arrived at "..locationName.."!")
      data = {["SignalBox"] = signalBox,["Location"] = locationName,["UniqueID"] = UID,["Time"] = timestamp}
    while response == false do
      messageSend = textutils.serialize(data)
      rednet.send(signalBoxID,messageSend,"stationStop")
      print("Sent: "..UID.." - "..timestamp.." to "..signalBox.."(ID: "..signalBoxID..")!")
      print("Awaiting response...")
      id,message,proto = rednet.receive(5)
        if id == signalBoxID and proto == "Train Info" then
          response = true
          print(message)
          trainInfo = textutils.unserialize(message)
          print(trainInfo.Dep)
          print(trainInfo.headCode)
          sleep(10)
        else
          print("No response...will try again shortly")
          sleep(5)
        end 
      end 
    else
      print(event)
      sleep(0.5)
    end
end


while true do
response = false
parallel.waitForAny(OStime(),waitTrain())
end

--Main
