local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "LM_HUD"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = false
gui.Parent = player:WaitForChild("PlayerGui")

local label = Instance.new("TextLabel")
label.Name = "Info"
label.Size = UDim2.fromOffset(240, 55)
label.Position = UDim2.fromOffset(15, 15)
label.BackgroundColor3 = Color3.fromRGB(30, 33, 39)
label.BackgroundTransparency = 0.15
label.BorderSizePixel = 0
label.TextColor3 = Color3.fromRGB(244, 244, 244)
label.Font = Enum.Font.GothamBold
label.TextSize = 15
label.Text = "LM Roblox | Moedas: 0"
label.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = label

local coins = player:WaitForChild("leaderstats"):WaitForChild("Moedas")
local function update()
    label.Text = "LM Roblox | Moedas: " .. tostring(coins.Value)
end
coins:GetPropertyChangedSignal("Value"):Connect(update)
update()
