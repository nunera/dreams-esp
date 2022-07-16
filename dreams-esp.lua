local default = Color3.new(0.227451, 0.827451, 0.827451)

local plrs = game:GetService("Players")
local localplr = plrs.LocalPlayer


local function highlight(v)
	if v == localplr then
	else
		local team = v.Team
		if team == nil then
			local highlight = Instance.new("Highlight")
			highlight.Parent = v.Character
			highlight.OutlineColor = default
			highlight.OutlineTransparency = 0.3
			highlight.FillColor = default
			highlight.FillTransparency = 0.5
		else
			local highlight = Instance.new("Highlight")
			local teamcolor = team.TeamColor
			local color3team = teamcolor.Color
			highlight.Parent = v.Character
			highlight.OutlineColor = color3team
			highlight.OutlineTransparency = 0.3
			highlight.FillColor = color3team
			highlight.FillTransparency = 0.5
		end
	end
end



for i,v in pairs(game.Players:GetChildren()) do
	highlight(v)
	v.CharacterAdded:Connect(function()
		highlight(v)
	end)
end

plrs.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function()
		highlight(plr)
	end)
end)
