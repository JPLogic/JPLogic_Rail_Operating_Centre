--Vars
local title = "Station Stop Manager"
local signalBox = "JPLogic Central"
local locationName = "Platform 1"
local signalBoxID = 6
----Self-Populate from Config
local data = {}
local data1 = {}
local response = false
--Startup
local stopBlock = "top"
local rednetSide = "back"
local signalBlock = "bottom"
local rfid = peripheral.wrap("right")
rednet.open(rednetSide)
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
      messageSend = textutils.serialise(data)
      rednet.send(signalBoxID,messageSend,"Checkpoint")
      print("Sent: "..UID.." - "..timestamp.." to "..signalBox.."(ID: "..signalBoxID..")!")
      print("Awaiting response...")
      id,messageBack,proto = rednet.receive(5)
        if id == signalBoxID and proto == "Train Info" then
          response = true
          print(messageBack)
          print(messageBack[1])
          data1 = textutils.unserialise(messageBack)
          print(data1[1])
          --print(data1[2])
          sleep(10)
        else
          print("No response...will try again shortly")
          print("---Will wait for 5 seconds...")
          sleep(5)
        end 
      end 
    else
      print(event)
      sleep(0.5)
    end
end


while true do
waitTrain()
end

--Main
