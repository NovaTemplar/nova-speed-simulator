local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Player = game.Players.LocalPlayer
local Window = OrionLib:MakeWindow({Name = "Kyro - By Nova", IntroText = "ScriptSlayers", IntroIcon = "rbxassetid://14836363253", HidePremium = false, SaveConfig = false, ConfigFolder = "Kyro"})

OrionLib:MakeNotification({
    Name = "Logged in!",
    Content = "You logged in as "..Player.Name..".",
    Image = "rbxassetid://4483345998",
    Time = 5
}) 

function RebirthNotification()
    OrionLib:MakeNotification({
        Name = "Hey "..Player.Name.."!",
        Content = "Auto Rebirth Successfully Started.",
        Image = "rbxassetid://14836421904",
        Time = 5
    }) 
end

function AdminCmdNotification()
    OrionLib:MakeNotification({
        Name = "Hey "..Player.Name.."!",
        Content = "Admin Commands Successfully Loaded.",
        Image = "rbxassetid://14836421904",
        Time = 5
    }) 
end

function DupeToolNotification()
    OrionLib:MakeNotification({
        Name = "Hey "..Player.Name.."!",
        Content = "Dupe Tool Successfully Loaded.",
        Image = "rbxassetid://14836421904",
        Time = 5
    }) 
end

function CollectAllOrbsNotification()
    OrionLib:MakeNotification({
        Name = "Hey "..Player.Name.."!",
        Content = "Successfully Started Collecting All The Orbs.",
        Image = "rbxassetid://14836421904",
        Time = 5
    }) 
end

function AutoClickNotification()
    OrionLib:MakeNotification({
        Name = "Hey "..Player.Name.."!",
        Content = "Successfully Started Auto Clicking.",
        Image = "rbxassetid://14836421904",
        Time = 5
    }) 
end

function SillyIcecreamNotification()
    OrionLib:MakeNotification({
        Name = "Hey "..Player.Name.."!",
        Content = "Successfully Started Giving Yourself Silly-Icecream Pet.",
        Image = "rbxassetid://14836421904",
        Time = 5
    }) 
end

function EarthButterflyNotification()
    OrionLib:MakeNotification({
        Name = "Hey "..Player.Name.."!",
        Content = "Successfully Started Giving Yourself Earth-Butterfly Pet.",
        Image = "rbxassetid://14836421904",
        Time = 5
    }) 
end

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
	AdminCmdNotification()
    end
})

MainTab:AddButton({
    Name = "Dupe Tool",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua"))()
	DupeToolNotification()
    end
})

MainTab:AddButton({
    Name = "Collect All Orbs",
    Callback = function()
	CollectAllOrbsNotification()
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
    Name = "Fast Auto Click (Bypassed)",
    Default = false,
    Callback = function(Value)
        autoSpinWheelEnabled = Value
        if autoSpinWheelEnabled then
            autoSpinWheel()
	    AutoClickNotification()
        end
    end    
})

MainTab:AddToggle({
    Name = "Auto Rebirth",
    Default = false,
    Callback = function(Value)
        autoRebirthEnabled = Value
        if autoRebirthEnabled then
            autoRebirth()
	    RebirthNotification()
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
	    SillyIcecreamNotification()
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
	    EarthButterflyNotification()
        end
    end    
})



OrionLib:Init()
