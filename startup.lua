-- Installer
term.clear()
term.setCursorPos(1,1)
print("JPLogic ROC")
print("Inital Boot?")
if fs.exists("Data/config") and fs.exists("startup-main") then
print("System is good")
print("All files exist")
print("Config file set")
print("Launching program...")
sleep(0.1)
shell.run("startup-main")
else
print("Config does not exist/missing file")
print("Launching Installer...")
sleep(0.5)
shell.run("installer")
end
