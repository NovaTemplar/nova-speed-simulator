local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Player = game.Players.LocalPlayer
local Window = OrionLib:MakeWindow({Name = "Kyro - By Nova", IntroText = "ScriptSlayers", IntroIcon = "rbxassetid://14836363253", HidePremium = false, SaveConfig = false, ConfigFolder = "Kyro"})

OrionLib:MakeNotification({
    Name = "Logged in!",
    Content = "You logged in as "..Player.Name..".",
    Image = "rbxassetid://4483345998",
    Time = 5
}) 

local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
}) 

local Section = MainTab:AddSection({
    Name = "Main Section"
})

local OtherTab = Window:MakeTab({
	Name = "Other's",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = OtherTab:AddSection({
    Name = "Main Section"
})

local autoSpinWheelEnabled = false
local autoBuyEnabled = false
local autoBuyEnabled1 = false
local autoRebirthEnabled = false

local function autoSpinWheel()
    while autoSpinWheelEnabled do
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("AddSpeed"):FireServer()

        wait(0.01)
    end
end

local function autoRebirth()
     while autoRebirthEnabled do
         game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Rebirth"):FireServer()

         wait(1)
    end
end

local function autoBuyWheel()
    while autoBuyEnabled do
        local args = {
         [1] = "Silly Icecream",
         [2] = false
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CanBuyEgg"):InvokeServer(unpack(args))

        wait(0.01)
    end
end

local function autoBuyWheel1()
    while autoBuyEnabled1 do
        local args = {
         [1] = "Earth Butterfly",
         [2] = false
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CanBuyEgg"):InvokeServer(unpack(args))

        wait(0.01)
    end
end

OtherTab:AddButton({
    Name = "Admin Cmd",
    Callback = function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
    end
})

MainTab:AddButton({
    Name = "Dupe Tool",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua"))()
    end
})

MainTab:AddButton({
    Name = "Collect All Orbs",
    Callback = function()
        while Wait() do
        local orbs = game:GetService("Workspace").GameAssets.GlobalAssets.OrbSpawns
        for i, v in pairs(orbs:GetChildren()) do
        if v:IsA("MeshPart") then
        local user = game.Players.LocalPlayer.Character.Head
        firetouchinterest(user, v, 0)
        elseif v:IsA("Model") then
        local summerOrb = v["Orb.1"]
        firetouchinterest(game.Players.LocalPlayer.Character.Head, summerOrb, 0)
        end
        end
        end
    end
})

MainTab:AddToggle({
    Name = "Fast Auto Click(Bypassed)",
    Default = false,
    Callback = function(Value)
        autoSpinWheelEnabled = Value
        if autoSpinWheelEnabled then
            autoSpinWheel()
        end
    end    
})

MainTab:AddToggle({
    Name = "Auto Rebirth",
    Default = false,
    Callback = function(Value)
        autoRebirthEnabled = Value
        if autoRebirthEnabled then
            autoRebirth()()
        end
    end    
})

MainTab:AddToggle({
    Name = "Give Silly-Icecream (Bypassed)",
    Default = false,
    Callback = function(Value)
        autoBuyEnabled = Value
        if autoBuyEnabled then
            autoBuyWheel()
        end
    end    
})

MainTab:AddToggle({
    Name = "Give Earth-Butterfly (Bypassed)",
    Default = false,
    Callback = function(Value)
        autoBuyEnabled1 = Value
        if autoBuyEnabled1 then
            autoBuyWheel1()
        end
    end    
})



OrionLib:Init()
