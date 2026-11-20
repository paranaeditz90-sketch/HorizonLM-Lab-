-- Mundo experimental gerado no servidor; nao altera assets externos.
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Config = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Config"))

local previous = workspace:FindFirstChild("LM_Demo")
if previous then previous:Destroy() end

local demo = Instance.new("Folder")
demo.Name = "LM_Demo"
demo.Parent = workspace

local function part(name, size, position, color, material)
    local item = Instance.new("Part")
    item.Name = name
    item.Anchored = true
    item.Size = size
    item.Position = position
    item.Color = color
    item.Material = material or Enum.Material.SmoothPlastic
    item.Parent = demo
    return item
end

part("Chao", Vector3.new(180, 2, 180), Vector3.new(0, -1, 0), Color3.fromRGB(79, 139, 76), Enum.Material.Grass)
part("EstradaHorizontal", Vector3.new(170, 0.15, 22), Vector3.new(0, 0.08, 30), Color3.fromRGB(49, 53, 59), Enum.Material.Asphalt)
part("EstradaVertical", Vector3.new(22, 0.15, 170), Vector3.new(30, 0.08, 0), Color3.fromRGB(49, 53, 59), Enum.Material.Asphalt)

local positions = {
    Vector3.new(-43, 11, -35),
    Vector3.new(-42, 14, 62),
    Vector3.new(62, 18, -40),
    Vector3.new(65, 10, 63),
}
for i, p in positions do
    local building = part("Predio_" .. i, Vector3.new(22, p.Y * 2, 23), p, Color3.fromRGB(120 + i * 12, 142 + i * 5, 170 - i * 10), Enum.Material.Concrete)
    building.CastShadow = true
    part("Telhado_" .. i, Vector3.new(25, 1, 26), p + Vector3.new(0, p.Y + 0.5, 0), Color3.fromRGB(53, 65, 77))
end

local spawn = Instance.new("SpawnLocation")
spawn.Name = "LM_Spawn"
spawn.Anchored = true
spawn.Neutral = true
spawn.CanCollide = true
spawn.Size = Vector3.new(12, 1, 12)
spawn.Position = Vector3.new(0, 0.5, 0)
spawn.Color = Color3.fromRGB(48, 167, 217)
spawn.Material = Enum.Material.Neon
spawn.Parent = demo

local function makeCoin(i, position)
    local coin = Instance.new("Part")
    coin.Name = "Moeda_" .. i
    coin.Shape = Enum.PartType.Ball
    coin.Size = Vector3.new(2, 2, 2)
    coin.Position = position
    coin.Anchored = true
    coin.CanCollide = false
    coin.Material = Enum.Material.Neon
    coin.Color = Color3.fromRGB(255, 204, 53)
    coin.Parent = demo
    local available = true

    coin.Touched:Connect(function(hit)
        if not available then return end
        local character = hit:FindFirstAncestorOfClass("Model")
        if not character or not character:FindFirstChildOfClass("Humanoid") then return end
        local player = Players:GetPlayerFromCharacter(character)
        if not player then return end
        local stats = player:FindFirstChild("leaderstats")
        local counter = stats and stats:FindFirstChild("Moedas")
        if not counter then return end
        available = false
        counter.Value += Config.InitialCoinValue
        coin.Transparency = 1
        coin.CanTouch = false
        task.delay(Config.CoinRespawnSeconds, function()
            if coin.Parent then
                coin.Transparency = 0
                coin.CanTouch = true
                available = true
            end
        end)
    end)
end

for i = 1, 12 do
    local x = -25 + (i % 4) * 14
    local z = -22 + math.floor((i - 1) / 4) * 14
    makeCoin(i, Vector3.new(x, 2.5, z))
end

Lighting.ClockTime = 16.5
Lighting.Brightness = 2
Lighting.Ambient = Color3.fromRGB(115, 115, 122)
print("[LM] Mundo de teste carregado")
