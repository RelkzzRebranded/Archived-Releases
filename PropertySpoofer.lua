if getgenv().PropertySpooferAlreadyExecuted then return end

getgenv().objsthatIsSpoofed = {}

getgenv().PropertySpooferAlreadyExecuted = true

getgenv().spoof = function(obj, property, value)
	local s = pcall(function()
		local lol = obj[property]
	end)
	if s then
		table.insert(objsthatIsSpoofed, {obj, property, value})
	end
end

getgenv().findwithintable = function(o, p)
	for i, v in pairs(objsthatIsSpoofed) do
		if table.find(v, o) and table.find(v, p) then
			return v
		end
	end
	return nil
end

getgenv().unspoof = function(obj, property)
	local lol = findwithintable(obj, property)
	if lol then
		table.remove(objsthatIsSpoofed, table.find(objsthatIsSpoofed, lol))
	end
end

local __index; __index = hookmetamethod(game, "__index", function(o, p)
	local t = findwithintable(o, p)
	if not checkcaller() and t ~= nil then
		return t[3]
	end

	return __index(o, p)
end)

