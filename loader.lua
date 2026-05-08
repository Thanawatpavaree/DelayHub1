local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/source.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Delay Hub",
    SubTitle = "AUTO FARM",
    TabWidth = 160,
    Size = UDim2.fromOffset(520, 350),
    Acrylic = true,
    Theme = "Dark"
})

----------------------------------------------------
-- TABS
----------------------------------------------------

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "home" }),
    Player = Window:AddTab({ Title = "Player", Icon = "user" }),
}

----------------------------------------------------
-- VARIABLES
----------------------------------------------------

getgenv().AutoSpeed = false
getgenv().AutoPower = false
getgenv().AutoKick = false

----------------------------------------------------
-- PLAYER TAB
----------------------------------------------------

Tabs.Player:AddButton({
    Title = "Teleport",
    Description = "วาร์ป",

    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character

        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = CFrame.new(0,10,0)
        end
    end
})

Tabs.Player:AddToggle("AutoSpeed", {
    Title = "Auto Speed Upgrade",
    Description = "อัปสปีดอัตโนมัติ",
    Default = false,

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

Tabs.Main:AddToggle("AutoPower", {
    Title = "Auto Power",
    Description = "อัปพลังอัตโนมัติ",
    Default = false,

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

Tabs.Main:AddToggle("AutoKick", {
    Title = "Auto Kick Best",
    Description = "เตะอัตโนมัติแรงสุด",
    Default = false,

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
-- NOTIFY
----------------------------------------------------

Fluent:Notify({
    Title = "Delay Hub",
    Content = "Loaded Successfully",
    Duration = 3
})
