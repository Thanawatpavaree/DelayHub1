local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/source.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Delay Hub",
    SubTitle = "BETA",
    TabWidth = 160,
    Size = UDim2.fromOffset(520, 350),
    Acrylic = true,
    Theme = "Dark"
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main" }),
}

Tabs.Main:AddButton({
    Title = "Test",
    Callback = function()
        print("Hello")
    end
})
