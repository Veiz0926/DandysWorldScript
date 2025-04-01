-- Основной скрипт для Dandy's World

-- Изменение скорости передвижения и силы прыжка
local speedMultiplier = 2.0
local jumpPowerMultiplier = 2.0

function toggleSpeedhack(enabled)
    if enabled then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16 * speedMultiplier
    else
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
    end
end

function toggleJumpPower(enabled)
    if enabled then
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50 * jumpPowerMultiplier
    else
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
    end
end

-- ESP
local espEnabled = false
function toggleESP()
    espEnabled = not espEnabled
    if espEnabled then
        -- Включить ESP
        for _, object in pairs(workspace:GetChildren()) do
            if object:FindFirstChild("Humanoid") then
                local espBox = Instance.new("BoxHandleAdornment")
                espBox.Size = object.HumanoidRootPart.Size
                espBox.Adornee = object.HumanoidRootPart
                espBox.ZIndex = 10
                espBox.AlwaysOnTop = true
                espBox.Color3 = Color3.new(1, 0, 0)
                espBox.Transparency = 0.5
                espBox.Parent = object.HumanoidRootPart
            end
        end
    else
        -- Выключить ESP
        for _, object in pairs(workspace:GetChildren()) do
            if object:FindFirstChild("Humanoid") and object.HumanoidRootPart:FindFirstChild("BoxHandleAdornment") then
                object.HumanoidRootPart.BoxHandleAdornment:Destroy()
            end
        end
    end
end

-- Автоматический сбор предметов
local autoCollectEnabled = false
function toggleAutoCollect()
    autoCollectEnabled = not autoCollectEnabled
    if autoCollectEnabled then
        game:GetService("RunService").Stepped:Connect(function()
            for _, item in pairs(workspace:GetChildren()) do
                if item:IsA("Tool") и (item.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude < 10 then
                    fireclickdetector(item:FindFirstChildOfClass("ClickDetector"))
                end
            end
        end)
    end
end

-- Полная яркость
function toggleFullBright()
    game.Lighting.Brightness = 2
    game.Lighting.ClockTime = 14
    game.Lighting.FogEnd = 100000
end

-- Автоматическая калибровка
function autoCalibrate()
    -- Пример автоматической калибровки
    game:GetService("RunService").Stepped:Connect(function()
        -- Автоматически выполняем действия
    end)
end

-- Телепортация к генератору
function tpToGenerator()
    for _, generator in pairs(workspace:GetChildren()) do
        if generator.Name == "Generator" then
            game.Players.LocalPlayer.Character.HуманоидRootPart.CFrame = generator.CFrame
            break
        end
    end
end

-- Автоматическая игра
function autoPlay()
    -- Пример автоматизации игрового процесса
    game:GetService("RunService").Stepped:Connect(function()
        -- Автоматически выполняем действия
    end)
end

-- Пример использования функций
toggleSpeedhack(true)
toggleJumpPower(true)
toggleESP()
toggleAutoCollect()
toggleFullBright()
autoCalibrate()
tpToGenerator()
autoPlay()
