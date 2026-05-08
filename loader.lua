local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "Delay Hub",
    Icon = "rbxassetid://0",
    Author = "AUTO FARM",
    Folder = "DelayHub",
    Size = UDim2.fromOffset(520, 350),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 170
})

----------------------------------------------------
-- TABS
----------------------------------------------------

local MainTab = Window:Tab({
    Title = "Main",
    Icon = "home"
})

local PlayerTab = Window:Tab({
    Title = "Player",
    Icon = "user"
})

----------------------------------------------------
-- VARIABLES
----------------------------------------------------

getgenv().AutoSpeed = false
getgenv().AutoPower = false
getgenv().AutoKick = false

----------------------------------------------------
-- PLAYER TAB
----------------------------------------------------

PlayerTab:Button({
    Title = "Teleport",
    Desc = "วาร์ป",

    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character

        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame =
                CFrame.new(0,10,0)
        end
    end
})

PlayerTab:Toggle({
    Title = "Auto Speed Upgrade",
    Desc = "อัปสปีดอัตโนมัติ",
    Value = false,

    Callback = function(Value)
        getgenv().AutoSpeed = Value

        while getgenv().AutoSpeed do
            task.wait(0.3)

            pcall(function()
                game:GetService("ReplicatedStorage")
                    .Shared.Packages.Network.rev_SPEED_UPGRADE
                    :FireServer(1)
            end)
        end
    end
})

----------------------------------------------------
-- MAIN TAB
----------------------------------------------------

MainTab:Toggle({
    Title = "Auto Power",
    Desc = "อัปพลังอัตโนมัติ",
    Value = false,

    Callback = function(Value)
        getgenv().AutoPower = Value

        while getgenv().AutoPower do
            task.wait(0.1)

            pcall(function()
                game:GetService("ReplicatedStorage")
                    .Shared.Packages.Network.rev_TaviMishkal
                    :FireServer()
            end)
        end
    end
})

MainTab:Toggle({
    Title = "Auto Kick Best",
    Desc = "เตะอัตโนมัติแรงสุด",
    Value = false,

    Callback = function(Value)
        getgenv().AutoKick = Value

        while getgenv().AutoKick do
            task.wait(0.1)

            pcall(function()
                game:GetService("ReplicatedStorage")
                    .Shared.Packages.Network.rev_KickEvent
                    :FireServer(0.9651641547679901)
            end)
        end
    end
})

----------------------------------------------------
-- AUTO TP WHEN TRANSFORM
----------------------------------------------------

game:GetService("ReplicatedStorage")
    .Shared.Packages.Network.rev_Transformed
    .OnClientEvent:Connect(function()

    local player = game.Players.LocalPlayer
    local character = player.Character

    if character and character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.CFrame =
            CFrame.new(712.1228637695312,3.8564038276672363,227.97109985351562)
    end
end)

----------------------------------------------------
-- NOTIFY
----------------------------------------------------

WindUI:Notify({
    Title = "Delay Hub",
    Content = "Loaded Successfully",
    Duration = 3
})
