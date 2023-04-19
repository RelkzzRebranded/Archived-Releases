
-- script is open source
--- REMINDER
print("dont go over 600 multiply or over 100 Amount or else it would do nothing.")
--- MAIN
local function GetPoints()
	game:GetService("Players").LocalPlayer.PlayerGui.CodesGUI.Frame.Enter.Code1:FireServer()
end
--- CHECK
if Multiply > 600 and Amount > 100 then return end
--- FUNCTION
for i=0, Amount * Multiply do
	GetPoints()
end
