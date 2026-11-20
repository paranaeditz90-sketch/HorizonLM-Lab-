local Players = game:GetService("Players")

local function setupPlayer(player)
    if player:FindFirstChild("leaderstats") then return end
    local stats = Instance.new("Folder")
    stats.Name = "leaderstats"
    stats.Parent = player

    local coins = Instance.new("IntValue")
    coins.Name = "Moedas"
    coins.Value = 0
    coins.Parent = stats
end

Players.PlayerAdded:Connect(setupPlayer)
for _, player in Players:GetPlayers() do
    setupPlayer(player)
end
