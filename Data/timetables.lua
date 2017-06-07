--Example Timetable
--(headCode) = {[signalbox]={["Platform"]=location,["Arr"]="",["Dep"]="",[Exit]=exitRoute}}
--Arr - NEW (If first station) or time(eg.0700) if on route.
--Dep - TERM (If last station) or time(eg.0715) if on route.
--Exit - TERM (If last station) or route(eg.UP_Main) if on route.

1H01 = {["JPLogic_Central"]={["Platform"]="1",["Arr"]="0600",["Dep"]="0630",["Exit"]="UP_Main"},["JPLogic_North"]={["Platform"]="2",["Arr"]="0700",["Dep"]="TERM",["Exit"]="TERM"}}
1H03 = {["JPLogic_Central"]={["Platform"]="2",["Arr"]="0610",["Dep"]="0640",["Exit"]="UP_Main"},["JPLogic_North"]={["Platform"]="1",["Arr"]="0710",["Dep"]="TERM",["Exit"]="TERM"}}
1H02 = {["JPLogic_North"]={["Platform"]="2",["Arr"]="NEW",["Dep"]="0730",["Exit"]="UP_Main"},["JPLogic_Central"]={["Platform"]="2",["Arr"]="0750",["Dep"]="TERM",["Exit"]="TERM"}}
1H04 = {["JPLogic_North"]={["Platform"]="1",["Arr"]="NEW",["Dep"]="0740",["Exit"]="UP_Main"},["JPLogic_Central"]={["Platform"]="1",["Arr"]="0750",["Dep"]="TERM",["Exit"]="TERM"}}
