--[[

-- Lost Room Script By brickmane
-- Discord : Cheerios#0447
-- Thanks to HamstaGang for esp :)
   ^
   |
His V3rmillion account : https://v3rmillion.net/member.php?action=profile&uid=334135

]]

local a=game:GetService("ProximityPromptService")local a=game:GetService("RunService")local c=game:GetService("Lighting")local d=game:GetService("Players")local d=d.LocalPlayer;local d=d.Character or d.CharacterAdded:Wait()local e=d:WaitForChild("Humanoid")local f=os.clock()getgenv()._Walkspeed={Enabled=false,Speed=20}getgenv()._ESPToggles={MonsterESP=false}getgenv()._FullBright={Enabled=false}local g={OriginBrightness=c.Brightness,OriginFogEnd=c.FogEnd,OriginGlobalShadow=c.GlobalShadows,OriginAmbient=c.Ambient,OriginOutdoorAmbient=c.OutdoorAmbient,OriginClockTime=c.ClockTime}local h='https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'local i=loadstring(game:HttpGet(h..'Library.lua'))()local j=loadstring(game:HttpGet(h..'addons/ThemeManager.lua'))()local h=loadstring(game:HttpGet(h..'addons/SaveManager.lua'))()if game.PlaceId==9431770682 then return i:Notify("Make sure you executed this in-game!")end;loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/SimpleESP.lua",true))()local h=i:CreateWindow({Tilte="Lost Room",Center=true,AutoShow=true})local j=h:AddTab("Main")local h=h:AddTab("UI Settings")local k=j:AddLeftGroupbox('[ Utilities ]')local j=j:AddLeftGroupbox('[ ESP ]')local h=h:AddLeftGroupbox('Menu')k:AddToggle('WALKSPEED_ENABLED',{Text="Toggle Walkspeed",Default=false,Tooltip="Turns on/off the Walkspeed Modifier"})k:AddSlider('WALKSPEED',{Text="Walkspeed",Default=20,Min=20,Max=50,Rounding=1})k:AddToggle('FULL_BRIGHT_ENABLED',{Text="Toggle Full Bright",Default=false,Tooltip="Tuns on/off the Full Bright"})j:AddToggle('MONSTER_ESP_ENABLED',{Text="Monster ESP",Default=false,Tooltip="Turns on/off Monster ESP"})Toggles.MONSTER_ESP_ENABLED:OnChanged(function()_ESPToggles["MonsterESP"]=Toggles.MONSTER_ESP_ENABLED.Value end)do local f;local h;local j;e.WalkSpeed=_Walkspeed["Speed"]b=e:GetPropertyChangedSignal("WalkSpeed"):Connect(function()if e and _Walkspeed["Enabled"]then e.WalkSpeed=_Walkspeed["Speed"]end;if i.Unloaded then h:Disconnect()end end)f=a.Stepped:Connect(function()pcall(function()if _FullBright["Enabled"]then c.Brightness=1;c.GlobalShadows=true;c.FogEnd=1000000000;c.Ambient=Color3.fromRGB(178,178,178)c.OutdoorAmbient=Color3.fromRGB(128,128,128)c.ClockTime=14 else c.Brightness=g.OriginBrightness;c.GlobalShadows=g.OriginGlobalShadow;c.FogEnd=g.OriginFogEnd;c.Ambient=g.OriginAmbient;c.OutdoorAmbient=g.OriginOutdoorAmbient;c.ClockTime=g.OriginClockTime end end)if i.Unloaded then f:Disconnect()end end)j=a.RenderStepped:Connect(function()pcall(function()local a=math.floor((workspace:WaitForChild("Turned").PrimaryPart.Position-d.HumanoidRootPart.Position).Magnitude)if _ESPToggles["MonsterESP"]then SESP_Clear("MonsterESP")SESP_Create(workspace:WaitForChild("Turned").PrimaryPart,"Monster","MonsterESP",Color3.fromRGB(255,0,0),a)else SESP_Clear("MonsterESP")end end)if i.Unloaded then SESP_Clear("MonsterESP")return j:Disconnect()end end)end;Options.WALKSPEED:OnChanged(function()_Walkspeed["Speed"]=Options.WALKSPEED.Value end)Toggles.WALKSPEED_ENABLED:OnChanged(function()_Walkspeed["Enabled"]=Toggles.WALKSPEED_ENABLED.Value end)Toggles.FULL_BRIGHT_ENABLED:OnChanged(function()_FullBright["Enabled"]=Toggles.FULL_BRIGHT_ENABLED.Value end)h:AddButton('Unload',function()i:Unload()end)h:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind',{Default='End',NoUI=true,Text='Menu keybind'})i.ToggleKeybind=Options.MenuKeybind;return i:Notify('Lost Room Scripts Loaded!\nLoad Time : '..math.ceil((os.clock()-f)).." seconds")
