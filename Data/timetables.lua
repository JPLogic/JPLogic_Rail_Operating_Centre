--Example Timetable
--(headCode) = {[signalbox]={["Platform"]=location,["Arr"]="",["Dep"]="",[Exit]=exitRoute}}
--Arr - NEW (If first station) or time(eg.0700) if on route.
--Dep - TERM (If last station) or time(eg.0715) if on route.
--Exit - TERM (If last station) or route(eg.UP_Main) if on route.

--Make sure that all Signal Box names and Locations are identical in each program, inconsistencies will break the timetable, causing failed trains.

1H01 = {["JPLogic Central"]={["Location"]="Platform 1",["Data"]={["Arr"]="0600",["Dep"]="0630",["Exit"]="UP_Main"}},["JPLogic North"]={["Location"]="Platform 2",["Data"]={["Arr"]="0700",["Dep"]="TERM",["Exit"]="TERM"}}}
1H03 = {["JPLogic Central"]={["Location"]="Platform 2",["Data"]={["Arr"]="0610",["Dep"]="0640",["Exit"]="UP_Main"}},["JPLogic North"]={["Location"]="Platform 1",["Data"]={["Arr"]="0710",["Dep"]="TERM",["Exit"]="TERM"}}}
    --Below need updating to new format!!
--1H02 = {["JPLogic_North"]={["Location"]="2",["Arr"]="NEW",["Dep"]="0730",["Exit"]="UP_Main"},["JPLogic_Central"]={["Platform"]="2",["Arr"]="0750",["Dep"]="TERM",["Exit"]="TERM"}}
--1H04 = {["JPLogic_North"]={["Location"]="1",["Arr"]="NEW",["Dep"]="0740",["Exit"]="UP_Main"},["JPLogic_Central"]={["Platform"]="1",["Arr"]="0750",["Dep"]="TERM",["Exit"]="TERM"}}
