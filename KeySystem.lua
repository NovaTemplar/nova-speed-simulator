local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Player = game.Players.LocalPlayer
local Window = OrionLib:MakeWindow({Name = "ScriptSlayer - KeySystem", IntroText = "KeySystem", HidePremium = false, SaveConfig = false, ConfigFolder = "ScriptSlayers"})

OrionLib:MakeNotification({
    Name = "Logged in!",
    Content = "Logged in as"..Player.Name..".",
    Image = "rbxassetid://4483345998",
    Time = 3
}) 

_G.Key = "Nova"
_G.KeyInput = "string"

function TrueKey()
    OrionLib:MakeNotification({
        Name = "Correct Key!",
        Content = "You have entered correct key.",
        Image = "rbxassetid://4483345998",
        Time = 3
    }) 
end

function FalseKey()
    OrionLib:MakeNotification({
        Name = "Incorrect Key!",
        Content = "You have entered incorrect key.",
        Image = "rbxassetid://4483345998",
        Time = 3
    }) 
end

function ScriptS()
    local id = game.PlaceId

    local supported = { 5293755937, 10857813475, 4911733121 }

    if table.find(supported, id) then
      loadstring(game:HttpGet('https://raw.githubusercontent.com/NovaTemplar/ScriptSlayers/main/'..id'.lua'))()
    else
      game.Players.LocalPlayer:Kick("🛡️ ScriptSlayers - Invalid Game")
    end
end

local MainTab = Window:MakeTab({
    Name = "Key",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
}) 

local Section = MainTab:AddSection({
    Name = "Key System"
})

MainTab:AddTextbox({
    Name = "Key",
    Default = "",
    TextDisappear = false,
    Callback = function(Value)
        _G.KeyInput = Value
    end
})

MainTab:AddButton({
    Name = "Check Key",
    Callback = function(Value)
        if _G.KeyInput == _G.Key then
        TrueKey()
        ScriptS()
        OrionLib:Destroy()
        else
            FalseKey()
        end
    end
})

OrionLib:Init()
