local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/source.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Delay Hub",
    SubTitle = "AUTO FARM",
    TabWidth = 160,
    Size = UDim2.fromOffset(520, 350),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- TAB
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "home" }),
}

----------------------------------------------------
-- VARIABLES
----------------------------------------------------

getgenv().AutoAttack = false
getgenv().AutoSpeed = false
getgenv().AutoPower = false

----------------------------------------------------
-- AUTO ATTACK
----------------------------------------------------

Tabs.Main:AddToggle("AutoAttack", {
    Title = "Auto Attack",
    Description = "ตีอัตโนมัติ",
    Default = false,

    Callback = function(Value)
        getgenv().AutoAttack = Value

        while getgenv().AutoAttack do
            task.wait(0.1)

            pcall(function()
                game:GetService("VirtualInputManager")
                    :SendMouseButtonEvent(0,0,0,true,game,0)

                game:GetService("VirtualInputManager")
                    :SendMouseButtonEvent(0,0,0,false,game,0)
            end)
        end
    end
})

----------------------------------------------------
-- AUTO SPEED
----------------------------------------------------

Tabs.Main:AddToggle("AutoSpeed", {
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
-- AUTO POWER
----------------------------------------------------

Tabs.Main:AddToggle("AutoPower", {
    Title = "Auto Power Upgrade",
    Description = "ถือไอเทมแล้วอัปพลังอัตโนมัติ",
    Default = false,

    Callback = function(Value)
        getgenv().AutoPower = Value

        while getgenv().AutoPower do
            task.wait(0.3)

            pcall(function()
                local player = game.Players.LocalPlayer
                local character = player.Character

                -- เช็คว่าถือ Tool อยู่ไหม
                local tool = character:FindFirstChildOfClass("Tool")

                if tool then
                    game:GetService("ReplicatedStorage")
                        .Shared.Packages.Network.rev_TaviMishkal
                        :FireServer()
                end
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
