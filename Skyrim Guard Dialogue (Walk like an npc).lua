-- Credits: https://v3rmillion.net/showthread.php?tid=1185738&pid=8350451#pid8350451
-- Edited by : brickmane
-- Social Media : Cheerios#0447

local plr = game.Players.LocalPlayer
local char = plr.Character

local Controls = require(plr.PlayerScripts:WaitForChild("PlayerModule")):GetControls()

plr.CharacterAdded:Connect(function(charupdate)
	char = charupdate
end)


local dialogue = {
   "I used to be an adventurer like you. Then I took an arrow in the knee...",
   "Let me guess... someone stole your sweetroll.",
   "Citizen.",
   "Disrespect the law, and you disrespect me.",
   "Trouble?",
   "What is it?",
   "My cousin's out fighting dragons, and what do I get? Guard duty.",
   "Gotta keep my eyes open. Damn dragons could swoop down at any time.",
   "Fear not. Come dragon or giant, we'll be ready.",
   "They say Helgen got hit by a dragon. One of those horrors comes here, we'll be ready.",
   "Brigands I can handle, but this talk of dragons? World's gone mad, I say.",
   "Everything's in order.",
   "Staying safe I hope.",
   "Everything all right?",
   "Helgen... destroyed by a dragon. Hard to believe, isn't it?",
   "Could sure use a warm bed right about now...",
   "What is it? Dragons?",
   "Watch the skies, traveler.",
   "They say Ulfric Stormcloak murdered the High King... with his voice! Shouted him apart!"
}


local function GetNearestPlayer()
	local distance = 15
	local closestplr = nil

	for _, v in ipairs(game.Players:GetPlayers()) do
		if v.Character and plr ~= v then
			local targetDistance = (char.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
			if targetDistance <= distance then
				closestplr = v.Character
				distance = targetDistance
			end
		end
	end

	return closestplr
end

-- ANTI STUCK ON A WALL THAT IS JUMPABLE
game:GetService("RunService").RenderStepped:Connect(function()
    local rayOrigin = char.HumanoidRootPart.Position
    local rayDirection = char.HumanoidRootPart.CFrame.LookVector*3 -- 3 studs between HumanoidRootPart's look vector

    local rayParams = RaycastParams.new()
    rayParams.FilterDescendantsInstances = {char}
    rayParams.FilterType = Enum.RaycastFilterType.Blacklist

    local rayResult = workspace:Raycast(rayOrigin, rayDirection, raycastParams)

    if rayResult then
		if rayResult.Instance.Size.Y > 3 then
			char.Humanoid.Jump = true
		elseif rayResult.Instance.Size.Y >= 7 then
			warn('Wall isnt jumpable')
		end
    end
end)

Controls:Disable()
task.wait(.5)
while wait(1) do
	-- THE MAIN
	local target = GetNearestPlayer()
	if target then
			char.Humanoid:MoveTo(target.HumanoidRootPart.Position + Vector3.new(0,2,0)) wait(.3)

			char.Humanoid.MoveToFinished:Wait()
			char.HumanoidRootPart.CFrame = CFrame.lookAt(char.HumanoidRootPart.Position, target.HumanoidRootPart.Position)
			task.wait(0.5)
			game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(dialogue[math.random(1, #dialogue)], "All")
			task.wait(3.5)
			char.Humanoid:MoveTo(char.HumanoidRootPart.Position + Vector3.new(math.random(-45, 45), 0, math.random(-45, 45)))

			char.Humanoid.MoveToFinished:Wait()
	else
			char.Humanoid:MoveTo(char.HumanoidRootPart.Position + Vector3.new(math.random(-45, 45), 0, math.random(-45, 45)))

			char.Humanoid.MoveToFinished:Wait()

			task.wait(2)
	end
end

