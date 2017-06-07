--Function
		function centerText(text)
			local x,y = term.getSize()
			local x1,y1 = term.getCursorPos()
			term.setCursorPos(math.ceil((x / 2) - (text:len() / 2)), y1)
			write(text)
		end
		function leftText(text)
			ox,oy = term.getCursorPos()
			local x,y = term.getSize()
			term.setCursorPos(1,y)
			local x1,y1 = term.getCursorPos()
			term.setCursorPos(math.ceil((x) - (text:len())), y1)
			write(text)
			term.setCursorPos(ox,oy)
		end
		function OStime()
			while true do
			local time = os.time()
			local fTime = textutils.formatTime(time,true)
			local fDay = os.day()
			leftText("Day: "..fDay.." Time: "..fTime)
			sleep(0.83)
		end
		end

--Program
	    local x,y = term.getSize()
	    os.loadAPI("OS_API/settings")
	    local settings = settings.open("OS_Data/config")
	    title = settings.read("Generic", "title")
	    OpVer = fs.open("Data/version","r")
	    OSver = OpVer.readAll()
		term.clear()
			term.setCursorPos(1,1)
				print("+-------------------------------------------------+")
			term.setCursorPos(1,1)
				centerText(title..": "..program)
			term.setCursorPos(1,y-1)
				print("+-------------------------------------------------+")
			term.setCursorPos(1,y)
				write("Version: "..OSver)
term.setCursorPos(1,2)
