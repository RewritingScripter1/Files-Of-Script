getgenv().Evolution = {
    ["Enabled"] = true,
    ["AimPart"] = "Head",
    ["Prediction"] = 0.12588,
    ["Smoothness"] = 0.07,
    ["ShakeValue"] = 0,
    ["AutoPred"] = true,
    ["Loaded"] = false,
    ["AutoReload"] = false,
    ["TTKO"] = false,
    ["AntiAimViewer"] = true,
    ["AutoReload"] = true,
    ["cframe"] = {
        ["enabled"] = false,
        ["speed"] = 2
    },
    ["TargetStrafe"] = {
        ["Enabled"] = false,
        ["StrafeSpeed"] = 10,
        ["StrafeRadius"] = 7,
        ["StrafeHeight"] = 3,
        ["RandomizerMode"] = false
    },
    ["targetaim"] = {
        ["Toggled"] = false,
        ["AutoShoot"] = false,
        ["enabled"] = true,
        ["targetPart"] = "UpperTorso",
        ["prediction"] = 0.12588
    },
    ["Triggerbot"] = {
        ["ClosestPart"] = {
            ["HitParts"] = {"Head", "UpperTorso", "LowerTorso", "HumanoidRootPart", "RightFoot", "LeftFoot"}
        },
        ["FOV"] = {
            ["Enabled"] = true,
            ["Size"] = 13,
            ["Centered"] = false,
            ["Visible"] = true,
            ["Filled"] = false,
            ["Color"] = Color3.fromRGB(255, 0, 0)
        },
        ["Settings"] = {
            ["Prediction"] = 0.111,
            ["ClickDelay"] = 0.1,
            ["ActivationDelay"] = 2,
            ["IgnoreFriends"] = false,
            ["AutomaticallyFire"] = false
        },
        ["Resolver"] = {
            ["Enabled"] = true,
            ["Method"] = "RecalculateVelocity",
            ["Prediction Settings"] = {
                ["HitPart"] = "Head"
            },
            ["desync"] = {
                ["sky"] = false,
                ["invis"] = true,
                ["jump"] = false,
                ["network"] = false
            },
            ["Misc"] = {
                ["LowGfx"] = false
            },
            ["FPSunlocker"] = {
                ["Enabled"] = true,
                ["FPSCap"] = 999
            }
        }
    }
}

local RS = game:GetService("RunService")

local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local TextButton = Instance.new("TextButton")
    local UITextSizeConstraint = Instance.new("UITextSizeConstraint")

    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Frame.BackgroundTransparency = 0
    Frame.Position = UDim2.new(1, -120, 0, 0)
    Frame.Size = UDim2.new(0, 100, 0, 50)

    TextButton.Parent = Frame

    TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextButton.BackgroundTransparency = 1.000
    TextButton.Size = UDim2.new(1, 0, 1, 0)
    TextButton.Font = Enum.Font.Arcade
    TextButton.Text = "Fuck"
    TextButton.TextColor3 = Color3.fromRGB(150, 0, 170)
    TextButton.TextScaled = true
    TextButton.TextSize = 24
    TextButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
    TextButton.TextStrokeTransparency = 0.000
    TextButton.TextWrapped = true
    TextButton.MouseButton1Down:Connect(
        function()
            Library:Toggle()
        end
    )

    UITextSizeConstraint.Parent = TextButton
    UITextSizeConstraint.MaxTextSize = 30

    local player = game.Players.LocalPlayer

   
    local function onCharacterAdded(character)
        ScreenGui.Parent = player.PlayerGui
    end

    local function connectCharacterAdded()
        player.CharacterAdded:Connect(onCharacterAdded)
    end

   
    connectCharacterAdded()

   
    player.CharacterRemoving:Connect(
        function()
            ScreenGui.Parent = nil
        end
    )


local repo = 'https://raw.githubusercontent.com/LionTheGreatRealFrFr/MobileLinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()




local Window =
        Library:CreateWindow(
        {
            Title = "Evolution.cc",
            Center = true,
            AutoShow = true
        }
    )

    local Tabs = {
        Main = Window:AddTab("Main"),
        Rage = Window:AddTab("Rage"),
        Visuals = Window:AddTab("Visuals"),
        ["UI Settings"] = Window:AddTab("Config")
    }



local Tool = Tabs.Main:AddLeftGroupbox("tool")

local Cam = Tabs.Main:AddLeftGroupbox("Camlock")

local Res = Tabs.Main:AddLeftGroupbox("Resolver")

local Tar = Tabs.Main:AddRightGroupbox("target aim")

local Tri = Tabs.Main:AddRightGroupbox("trigger bot")

local cframe = Tabs.Rage: AddRightGroupbox("Speed")

local TargetStrafe = Tabs.Rage: AddLeftGroupbox("Target strafe")

local Fov = Tabs.Visuals: AddLeftGroupbox("Fov")

local Esp = Tabs.Visuals: AddLeftGroupbox("Esp") 


Cam:AddToggle(
        "Enable Camlock",
        {
            Text = "Enable camlock",
            Default = true,
            Tooltip = "Enable",
            Callback = function(state)
             Evolution.Enabled = state
            end 
        }
    )

Cam:AddToggle(
        "Enable ttko",
        {
            Text = "Enable ttko",
            Default = false,
            Tooltip = "Enable",
            Callback = function(state)
               Evolution.TTKO = state
            end
        }
    ) 

Cam:AddToggle(
        "Enable autopred",
        {
            Text = "Enable autopred",
            Default = false,
            Tooltip = "Enable",
            Callback = function(state)
               Evolution.AutoPred = state
            end
        }
    ) 



Cam:AddInput(
        "Prediction",
        {
            Default = "Prediction",
            Numeric = false,
            Finished = false,
            Text = "Prediction",
            Tooltip = "Change Prediction For Target",
            Placeholder = "0.1398",
            Callback = function(value)
                Evolution.Prediction = value
            end
        }
    )
    

Cam:AddInput(
        "Smoothness",
        {
            Default = "smoothness",
            Numeric = false,
            Finished = false,
            Text = "smoothness",
            Tooltip = "Change smoothing For Target",
            Placeholder = "0.9",
            Callback = function(value)
                Evolution.Smoothness = value
            end
        }
    )

Cam:AddInput(
        "Shake",
        {
            Default = "Shake",
            Numeric = false,
            Finished = false,
            Text = "shake ",
            Tooltip = "Change shake For Target",
            Placeholder = "0",
            Callback = function(value)
                Evolution.ShakeValue = value
            end
        }
    )

Cam:AddDropdown(
        "Hitpart",
        {
            Values = {"Head", "UpperTorso", "HumanoidRootPart", "LowerTorso", "LeftHand", "RightHand", "LeftLowerArm", "RightLowerArm", "LeftUpperArm", "RightUpperArm", "LeftFoot", "LeftLowerLeg",  "LeftUpperLeg", "RightLowerLeg", "RightFoot",  "RightUpperLeg"},
            Default = 1,
            Multi = false,
            Text = "Hitpart",
            Tooltip = "Choose the hit part",
            Callback = function(value)
                Evolution.AimPart = value
            end
        }
    )

Tar:AddToggle(
        "Enable TargetAim",
        {
            Text = "Enable targetaim",
            Default = false,
            Tooltip = "Enable",
            Callback = function(state)
               targetaim.enabled = state
            end
        }
    )
    
Tar:AddToggle(
        "AutoShoot",
        {
            Text = "AutoShoot",
            Default = false,
            Tooltip = "Enable",
            Callback = function(state)
            targetaim.AutoShoot = state
            end
        }
    )

Tar:AddInput(
        "Prediction",
        {
            Default = "Prediction",
            Numeric = false,
            Finished = false,
            Text = "Prediction",
            Tooltip = "Change Prediction For Target",
            Placeholder = "0.1355",
            Callback = function(value)
                targetaim.prediction = value
            end
        }
    )
    

Tar:AddToggle(
        "Enable autopred",
        {
            Text = "Enable autopred",
            Default = false,
            Tooltip = "Enable",
            Callback = function(state)
               targetaim.AutoPred = state
            end
        }
    ) 

Tar:AddDropdown(
        "Hitpart",
        {
            Values = {"Head", "UpperTorso", "HumanoidRootPart", "LowerTorso", "LeftHand", "RightHand", "LeftLowerArm", "RightLowerArm", "LeftUpperArm", "RightUpperArm", "LeftFoot", "LeftLowerLeg",  "LeftUpperLeg", "RightLowerLeg", "RightFoot",  "RightUpperLeg"},
            Default = 1,
            Multi = false,
            Text = "Hitpart",
            Tooltip = "Choose the hit part",
            Callback = function(value)
                targetaim.targetPart = value
            end
        }
    )
Tar:AddToggle(
        "Enable AutoReload",
        {
            Text = "Enable AutoReload",
            Default = false,
            Tooltip = "Enable",
            Callback = function(state)
               Evolution.AutoReload = state
            end
        }
    ) 


Res:AddToggle(
        "Enable Resolver",
        {
            Text = "Enable resolver",
            Default = true,
            Tooltip = "Enable",
            Callback = function(state)
             Evolution.Resolver.Enabled = state
            end 
        }
    )

Res:AddDropdown(
        "Resolver",
        {
            Values = {"RecalculateVelocity"},
            Default = 1,
            Multi = false,
            Text = "Resolver Mode",
            Tooltip = "Choose the resolving method",
            Callback = function(value)
                Evolution.Resolver.Method = value
            end
        }
    )


Tri:AddToggle(
        "Enable TriggerBot",
        {
            Text = "Enable TriggerBot",
            Default = false,
            Tooltip = "Enable",
            Callback = function(state)
               Evolution.Triggerbot.Settings["Automatically Fire"] = state
            end
        }
    )

Tri:AddInput(
        "Click delay",
        {
            Default = "click delay",
            Numeric = false,
            Finished = false,
            Text = "click delay",
            Tooltip = "Change delay For Clicks",
            Placeholder = "0.1",
            Callback = function(value)
                Evolution.Triggerbot.Settings["Click Delay"] = value
            end
        }
    )

Tri:AddInput(
        "activation delay",
        {
            Default = "activation delay",
            Numeric = false,
            Finished = false,
            Text = "click delay",
            Tooltip = "Change delay For Clicks",
            Placeholder = "3",
            Callback = function(value)
                Evolution.Triggerbot.Settings["Activation Delay"] = value
            end
        }
    )




TargetStrafe:AddToggle(
        "Target Strafe",
        {
            Text = "Target Strafe",
            Default = false,
            Tooltip = "Enable",
            Callback = function(state)
                Evolution.TargetStrafe.Enabled = state
            end
        }
    )

TargetStrafe:AddToggle(
        "Target Strafe randomiser",
        {
            Text = "Target Strafe randomiser",
            Default = false,
            Tooltip = "Enable",
            Callback = function(state)
                Evolution.TargetStrafe.RandomizerMode = state
            end
        }
    )



TargetStrafe:AddSlider(
    "Target speed",
    {
        Text = "How fast you spin around target",
        Default = 0,
        Min = 0,
        Max = 50,
        Rounding = 1,
        Compact = false,
        Callback = function(Value)
            Evolution.TargetStrafe.StrafeSpeed = Value
        end
    }
)

TargetStrafe:AddSlider(
    "Target radius",
    {
        Text = "How far you are around target",
        Default = 0,
        Min = 0,
        Max = 50,
        Rounding = 1,
        Compact = false,
        Callback = function(Value)
            Evolution.TargetStrafe.StrafeRadius = Value
        end
    }
)

TargetStrafe:AddSlider(
    "Target height",
    {
        Text = "How heigh you are from the target",
        Default = 0,
        Min = 0,
        Max = 50,
        Rounding = 1,
        Compact = false,
        Callback = function(Value)
            Evolution.TargetStrafe.StrafeHeight = Value
        end
    }
)




cframe:AddToggle(
        "Enable cframe",
        {
            Text = "Enable cframe",
            Default = false,
            Tooltip = "Enable",
            Callback = function(state)
               Evolution.cframe.enabled = state
            end
        }
    )

cframe:AddSlider(
    "cframe speed",
    {
        Text = "How fast you run around ",
        Default = 0,
        Min = 0,
        Max = 50,
        Rounding = 1,
        Compact = false,
        Callback = function(Value)
            Evolution.cframe.Speed = Value
        end
    }
)



Tool:AddButton(
    "Create tool",
    function()
       spawnTool()
    end
)

Tool:AddButton(
    "Create Button",
    function()
       spawnButton()
    end
)

Tool:AddButton(
    "Controller (dpad up)",
    function()
       setupController()
    end
)

Esp:AddButton(
   "Esp", 
   function() 
     loadstring(game:HttpGet("https://raw.githubusercontent.com/RewritingScripter1/ScriptPlace/refs/heads/main/Esp.lua"))()
     end
) 

local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' })

Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })

ThemeManager:SetFolder('Evolutionlua')
SaveManager:SetFolder('Evolutionlua/configs')

SaveManager:BuildConfigSection(Tabs['UI Settings'])
ThemeManager:ApplyToTab(Tabs['UI Settings'])

SaveManager:LoadAutoloadConfig()









loadstring(Game:HttpGet("https://raw.githubusercontent.com/Pixeluted/adoniscries/refs/heads/main/Source.lua", true))()

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local GuiService = game:GetService("GuiService")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

-- Function to create the FOV circle
local function createFOVCircle()
    local circle = Drawing.new("Circle")
    circle.Thickness = 1
    circle.Color = Evolution.Triggerbot.FOV.Color
    circle.Filled = Evolution.Triggerbot.FOV.Filled
    circle.Visible = Evolution.Triggerbot.FOV.Enabled
    return circle
end

local FOVCircle = createFOVCircle()

-- Function to update the FOV circle's position and size
local function updateFOVCircle()
    if Evolution.Triggerbot.FOV.Enabled then
        FOVCircle.Radius = Evolution.Triggerbot.FOV.Size
        FOVCircle.Visible = true

        if Evolution.Triggerbot.FOV["Centered FOV"] then
            FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
        else
            local mousePos = UserInputService:GetMouseLocation()
            FOVCircle.Position = mousePos
        end
    else
        FOVCircle.Visible = false
    end
end

-- Function to validate if the target is valid
local function isTargetValid(player)
    return player and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0
end

-- Function to get the closest player to the mouse or FOV center
local function getMouseTarget()
    local mousePos = Evolution.Triggerbot.FOV["Centered FOV"] 
                     and Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2) 
                     or UserInputService:GetMouseLocation()
    local closestPlayer = nil
    local closestDistance = Evolution.Triggerbot.FOV.Size

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and isTargetValid(player) then
            for _, hitPartName in ipairs(Evolution.Triggerbot.ClosestPart.HitParts) do
                local hitPart = player.Character and player.Character:FindFirstChild(hitPartName)
                if hitPart then
                    local partPos = Camera:WorldToViewportPoint(hitPart.Position)
                    local distance = (Vector2.new(partPos.X, partPos.Y) - mousePos).Magnitude

                    if distance < closestDistance then
                        closestDistance = distance
                        closestPlayer = player
                    end
                end
            end
        end
    end

    return closestPlayer
end

-- Function to fire at the selected target
local function fireAtTarget(target)
    if target then
        local Tool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
        if Tool and Tool:FindFirstChild("Handle") then
            Tool:Activate()
            task.wait(Evolution.Triggerbot.Settings["Click Delay"])
            Tool:Deactivate()
        end
    end
end

-- Function to get the closest player using advanced calculations
local function GetClosestPlayer()
    local closestPlayer = nil
    local shortestScore = math.huge

    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and isTargetValid(plr) then
            local part = plr.Character[Evolution.AimPart]
            if part then
                local relativePos = part.Position - Camera.CFrame.Position
                local playerDistance = relativePos.Magnitude
                local screenPosition, onScreen = Camera:WorldToViewportPoint(part.Position)

                if onScreen then
                    local angle = math.deg(math.acos(Camera.CFrame.LookVector:Dot(relativePos.Unit)))
                    local mouseDistance = (Vector2.new(screenPosition.X, screenPosition.Y) - UserInputService:GetMouseLocation()).Magnitude

                    local angleFactor = angle / 90
                    local distanceFactor = playerDistance / 1000

                    local score = mouseDistance * 0.3 + angleFactor * 0.5 + distanceFactor * 0.2

                    local ray = Ray.new(Camera.CFrame.Position, relativePos.Unit * playerDistance)
                    local hitPart = Workspace:FindPartOnRayWithIgnoreList(ray, {LocalPlayer.Character})

                    if (not hitPart or hitPart:IsDescendantOf(plr.Character)) and score < shortestScore then
                        closestPlayer = plr
                        shortestScore = score
                    end
                end
            end
        end
    end

    return closestPlayer
end



local userInputService = game:GetService("UserInputService")

local AimlockState = true
local Locked = false
local Victim
local target

if Evolution.Loaded then
    Library:Notify('Already Loaded')
    return
end

Evolution.Loaded = true

local function ToggleLock()
    if AimlockState then
        Locked = not Locked
        if Locked then
            Victim = GetClosestPlayer()
            target = Victim
            if Victim then
                if Evolution.Enabled then
                    Library:Notify('Locked On: ' .. tostring(Victim.Name))
                end
                if Evolution.targetaim.enabled then
                    Evolution.targetaim["Toggled"] = true
                    Library:Notify('Locked On: ' .. tostring(target.Name))
                end
            else
                if Evolution.Enabled then
                    Library:Notify('Camlock: No target found')
                end
                if Evolution.targetaim.enabled then
                    Evolution.targetaim["Toggled"] = false
                    Library:Notify('Target Lock: No target found')
                end
            end
        else
            Victim = nil
            target = nil
            if Evolution.Enabled then
                Library:Notify('Camlock: Unlocked!')
            end
            if Evolution.targetaim.enabled then
                Evolution.targetaim["Toggled"] = false
                Library:Notify('Target Lock: Unlocked!')
            end
        end
    else
        if not Evolution.Enabled then
            Library:Notify('Camlock not enabled')
        end
    end
end


local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local userInputService = game:GetService("UserInputService")

-- Function for the "Tool" mode
function spawnTool()
    local Tool = Instance.new("Tool")
    Tool.RequiresHandle = false
    Tool.Name = "Lock Tool"
    Tool.Parent = player.Backpack

    local function onCharacterAdded()
        Tool.Parent = player.Backpack
    end

    player.CharacterAdded:Connect(onCharacterAdded)

    player.CharacterRemoving:Connect(function()
        Tool.Parent = player.Backpack
    end)

    Tool.Activated:Connect(function()
        ToggleLock()
    end)
end

-- Function for the "Button" mode
function spawnButton()
    local function setupGui()
        local screenGui = playerGui:FindFirstChild("LockScreenGui")

        if not screenGui then
            screenGui = Instance.new("ScreenGui")
            screenGui.Name = "LockScreenGui"
            screenGui.Parent = playerGui
        end

        local button = screenGui:FindFirstChild("LockButton")

        if not button then
            button = Instance.new("TextButton")
            button.Name = "LockButton"
            button.Size = UDim2.new(0, 140, 0, 70)
            button.Position = UDim2.new(0.5, -100, 0.8, -25)
            button.Text = "Lock/Target"
            button.TextSize = 17
            button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.Parent = screenGui
            button.Active = true
            button.Draggable = true

            local UICorner = Instance.new("UICorner")
            UICorner.CornerRadius = UDim.new(0, 25)
            UICorner.Parent = button

            button.MouseButton1Click:Connect(function()
                ToggleLock()
            end)
        end
    end

    setupGui()

    player.CharacterAdded:Connect(function()
        setupGui()
    end)
end

-- Function for the "Controller" mode
function setupController()
    userInputService.InputBegan:Connect(function(input, processed)
        if not processed then
            if input.KeyCode == Enum.KeyCode.DPadUp then
                ToggleLock()
            end
        end
    end)
end

RS.RenderStepped:Connect(function()
    if AimlockState and Victim and Victim.Character and Victim.Character:FindFirstChild(Evolution.AimPart) then
        local aimPart = Victim.Character[Evolution.AimPart]
        local targetPosition = aimPart.Position + aimPart.Velocity * Evolution.Prediction
        local lookPosition = CFrame.new(Camera.CFrame.p, targetPosition)
        Camera.CFrame = Camera.CFrame:Lerp(lookPosition, Evolution.Smoothness)

        if Evolution.TargetStrafe.Enabled then
            local lp = player.Character
            local targpos = Victim.Character.HumanoidRootPart.Position
            local strafeOffset
            
            if Evolution.TargetStrafe.RandomizerMode then
               
                strafeOffset = Vector3.new(
                    math.random(-Evolution.TargetStrafe.StrafeRadius, Evolution.TargetStrafe.StrafeRadius),
                    math.random(0, Evolution.TargetStrafe.StrafeHeight),
                    math.random(-Evolution.TargetStrafe.StrafeRadius, Evolution.TargetStrafe.StrafeRadius)
                )
            else
               
                strafeOffset = Vector3.new(
                    math.cos(tick() * Evolution.TargetStrafe.StrafeSpeed) * Evolution.TargetStrafe.StrafeRadius,
                    Evolution.TargetStrafe.StrafeHeight,
                    math.sin(tick() * Evolution.TargetStrafe.StrafeSpeed) * Evolution.TargetStrafe.StrafeRadius
                )
            end

           
            local strafePosition = targpos + strafeOffset
            strafePosition = Vector3.new(strafePosition.X, math.max(strafePosition.Y, targpos.Y), strafePosition.Z)
            
            lp:SetPrimaryPartCFrame(CFrame.new(strafePosition))
            player.Character.HumanoidRootPart.CFrame = CFrame.new(
                player.Character.HumanoidRootPart.CFrame.Position,
                Vector3.new(targpos.X, player.Character.HumanoidRootPart.CFrame.Position.Y, targpos.Z)
            )
        end
    end
end)

spawn(function()
    RS.Heartbeat:Connect(function()
        if Evolution.Enabled and Evolution.cframe.enabled then
            player.Character.HumanoidRootPart.CFrame =
                player.Character.HumanoidRootPart.CFrame + player.Character.Humanoid.MoveDirection * Evolution.cframe.speed
        end
    end)
end)

for _, con in pairs(getconnections(Camera.Changed)) do
    con:Disable()
end
for _, con in pairs(getconnections(Camera:GetPropertyChangedSignal("CFrame"))) do
    con:Disable()
end

local mt = getrawmetatable(game)
local oldNameCall = mt.__namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(Self, ...)
    local args = {...}
    local methodName = getnamecallmethod()
    if not checkcaller() and methodName == "FireServer" and Evolution.targetaim.enabled then
        for i, Argument in ipairs(args) do
            if typeof(Argument) == "Vector3" and target and target.Character then
                args[i] = target.Character[Evolution.targetaim.targetPart].Position + (target.Character[Evolution.targetaim.targetPart].Velocity * Evolution.targetaim.prediction)
                return oldNameCall(Self, unpack(args))
            end
        end
    end
    return oldNameCall(Self, ...)
end)

setreadonly(mt, true)

while task.wait() do
    if Evolution.TTKO and Victim and Victim.Character and Victim.Character:FindFirstChild("Humanoid") then
        if Victim.Character.Humanoid.Health <= 2 then
            local chatEvents = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
            if chatEvents and chatEvents:FindFirstChild("SayMessageRequest") then
                local sayMessageRequest = chatEvents.SayMessageRequest
                if sayMessageRequest and sayMessageRequest:IsA("RemoteEvent") then
                    sayMessageRequest:FireServer("tap in w Evolution lua bro", "All")
                    wait(0.6)
                    sayMessageRequest:FireServer("ur dirt btw", "All")
                elseif sayMessageRequest and sayMessageRequest:IsA("RemoteFunction") then
                    sayMessageRequest:InvokeServer("tap in w Evolution lua bro", "All")
                    wait(0.6)
                    sayMessageRequest:InvokeServer("ur dirt btw", "All")
                end
            end
        end
    end
end

while task.wait() do
    if Evolution.Enabled and Evolution.AutoPred then
        local pingValue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
        local ping = tonumber((pingValue:match("%d+")))
        if ping then
            if ping > 225 then
                Evolution.Prediction = 0.166547
            elseif ping > 215 then
                Evolution.Prediction = 0.15692
            elseif ping > 205 then
                Evolution.Prediction = 0.165732
            elseif ping > 190 then
                Evolution.Prediction = 0.1690
            elseif ping > 185 then
                Evolution.Prediction = 0.1235666
            elseif ping > 180 then
                Evolution.Prediction = 0.16779123
            elseif ping > 175 then
                Evolution.Prediction = 0.165455312399999
            elseif ping > 170 then
                Evolution.Prediction = 0.16
            elseif ping > 165 then
                Evolution.Prediction = 0.15
            elseif ping > 160 then
                Evolution.Prediction = 0.1223333
            elseif ping > 155 then
                Evolution.Prediction = 0.125333
            elseif ping > 150 then
                Evolution.Prediction = 0.1652131
            elseif ping > 145 then
                Evolution.Prediction = 0.129934
            elseif ping > 140 then
                Evolution.Prediction = 0.1659921
            elseif ping > 135 then
                Evolution.Prediction = 0.1659921
            elseif ping > 130 then
                Evolution.Prediction = 0.12399
            elseif ping > 125 then
                Evolution.Prediction = 0.15465
            elseif ping > 110 then
                Evolution.Prediction = 0.142199
            elseif ping > 105 then
                Evolution.Prediction = 0.141199
            elseif ping > 100 then
                Evolution.Prediction = 0.134143
            elseif ping > 90 then
                Evolution.Prediction = 0.1433333333392
            elseif ping > 80 then
                Evolution.Prediction = 0.143214443
            elseif ping > 70 then
                Evolution.Prediction = 0.14899911
            elseif ping > 60 then
                Evolution.Prediction = 0.148325
            elseif ping > 50 then
                Evolution.Prediction = 0.128643
            elseif ping > 40 then
                Evolution.Prediction = 0.12766
            elseif ping > 30 then
                Evolution.Prediction = 0.124123
            elseif ping > 20 then
                Evolution.Prediction = 0.12435
            elseif ping > 10 then
                Evolution.Prediction = 0.1234555
            elseif ping < 10 then
                Evolution.Prediction = 0.1332
            else
                Evolution.Prediction = 0.1342
            end
        end
      end
    end
        

Evolution.AntiGroundShots = true

if Evolution.AntiGroundShots then
    AimPoint = Evolution.AimPart.Position + Vector3.new(Evolution.AimPart.Velocity.X, (Evolution.AimPart.Velocity.Y * 0.5), Evolution.AimPart.Velocity.Z) * prediction
else
    AimPoint = Evolution.AimPart.Position + Evolution.AimPart.Velocity * prediction
end


while Evolution.AutoReload == true and game:GetService("RunService").Heartbeat:Wait() do
if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then
            if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild("Ammo") then
                if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild("Ammo").Value <= 0 then
                    game:GetService("ReplicatedStorage").MainEvent:FireServer("Reload", game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool")) 
                    wait(1)
                end
            end
        end
end



if Evolution.desync.sky == true then
    getgenv().EvolutionSky = true 
    getgenv().SkyAmount = 90

    game:GetService("RunService").Heartbeat:Connect(function()
        if getgenv().EvolutionSky then 
            local vel = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
            game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, getgenv().SkyAmount, 0) 
            game:GetService("RunService").RenderStepped:Wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = vel
        end
    end)
end

if Evolution.desync.jump == true then
    getgenv().jumpanti = true
    
    game:GetService("RunService").Heartbeat:Connect(function()
        if getgenv().jumpanti then    
            local CurrentVelocity = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
            game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(1000, 1000, 1000)
            game:GetService("RunService").RenderStepped:Wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = CurrentVelocity
        end
    end)
end

if Evolution.desync.jump == true then

-- Maximum Roblox velocity (128^2 or 16384)
local velMax = (128 ^ 2)

local timeRelease, timeChoke = 0.015, 0.105

local Property, Wait = sethiddenproperty, task.wait
local Radian, Random, Ceil = math.rad, math.random, math.ceil
local Angle = CFrame.Angles
local Vector = Vector3.new
local Service = game.GetService

local Run = Service(game, 'RunService')
local Stats = Service(game, 'Stats')
local Players = Service(game, 'Players')
local LocalPlayer = Players.LocalPlayer
local statPing = Stats.PerformanceStats.Ping
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Root = Character:WaitForChild("HumanoidRootPart")
local Mouse = LocalPlayer:GetMouse()

local runRen, runBeat = Run.RenderStepped, Run.Heartbeat
local runRenWait, runRenCon = runRen.Wait, runRen.Connect
local runBeatCon = runBeat.Connect

local function Ping()
    return statPing:GetValue()
end

local function Sleep()
    Property(Root, 'NetworkIsSleeping', true)
end

local function FireGun()
    local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
    if tool and tool:FindFirstChild("Shoot") then
        local ShootEvent = tool.Shoot
        ShootEvent:FireServer(Mouse.Hit.Position)
    end
end

local function Init()
    if not Root then return end

    local rootVel = Root.Velocity
    local rootCFrame = Root.CFrame

   
    local rootAng = Random(-180, 180)
    local rootOffset do
        local X = Random(-velMax, velMax)
        local Y = Random(0, velMax)
        local Z = Random(-velMax, velMax)
        rootOffset = Vector(X, -Y, Z)
    end

    Root.CFrame = Angle(0, Radian(rootAng), 0)
    Root.Velocity = rootOffset

   
    FireGun()


    runRenWait(runRen)
    Root.CFrame = rootCFrame
    Root.Velocity = rootVel
end

runBeatCon(runBeat, Init)

-- Main loop for choking replication
while Wait(timeRelease) do
    -- Stable replication packets
    local chokeClient, chokeServer = runBeatCon(runBeat, Sleep), runRenCon(runRen, Sleep)

    Wait(Ceil(Ping()) / 1000)

    chokeClient:Disconnect()
    chokeServer:Disconnect()

end
end

if Evolution.desync.network == true then
local RunService = game:GetService("RunService")

local function onHeartbeat()
    setfflag("S2PhysicsSenderRate", 1)
end

RunService.Heartbeat:Connect(onHeartbeat)
end

if Evolution.Misc.LowGfx == true then
game:GetService("CorePackages").Packages:Destroy()
end

if Evolution.FPSunlocker.Enabled then
    setfpscap(Evolution.FPSunlocker.FPSCap)
end

if Evolution.AntiAimViewer == true then

--// Services
local Evolution = setmetatable({}, {
    __index = function(_, service)
        return game:GetService(service)
    end
})

local Players, ReplicatedStorage = Evolution.Players, Evolution.ReplicatedStorage
local LocalPlayer, Mouse = Players.LocalPlayer, Players.LocalPlayer:GetMouse()
local MainEvent = ReplicatedStorage:FindFirstChild("MainEvent")

--// Bypass Function
local function Bypass(entity)
    entity.ChildAdded:Connect(function(child)
        if child:IsA("Tool") then
            child.Activated:Connect(function()
                if MainEvent then
                    MainEvent:FireServer("UpdateMousePos", Mouse.Hit.Position)
                end
            end)
        end
    end)
end

--// Check if Player is Alive
local function IsAlive(player)
    local character = player and player.Character
    return character and character:FindFirstChild("Humanoid") and character:FindFirstChild("Head")
end

--// Setup Bypass for Local Player
LocalPlayer.CharacterAdded:Connect(Bypass)
if IsAlive(LocalPlayer) then
    LocalPlayer.Character.Humanoid:UnequipTools()
    Bypass(LocalPlayer.Character)
end

--// Hook Metamethod
local Hook
Hook = hookmetamethod(game, "__namecall", function(self, ...)
    local args = {...}
    if not checkcaller() and getnamecallmethod() == "FireServer" and self.Name == "MainEvent" and args[1] == "UpdateMousePos" then
        args[2] = Mouse.Hit.Position
        return self.FireServer(self, unpack(args))
    end
    return Hook(self, ...)
end)
end

local lastPosition = nil
local lastUpdateTime = tick()

local function resolveTargetVelocity(target)
    if getgenv().Evolution.Resolver.Enabled then
        if getgenv().Evolution.Resolver.Method == "RecalculateVelocity" then
            local currentTime = tick()
            local deltaTime = currentTime - lastUpdateTime

            if lastPosition then
                local resolvedVelocity = (target.Character[getgenv().Evolution.Resolver["Prediction Settings"].HitPart].Position - lastPosition) / deltaTime
                lastPosition = target.Character[getgenv().Evolution.Resolver["Prediction Settings"].HitPart].Position
                lastUpdateTime = currentTime
                return resolvedVelocity
            else
                lastPosition = target.Character[getgenv().Evolution.Resolver["Prediction Settings"].HitPart].Position
                lastUpdateTime = currentTime
            end
        end
    end
    return target.Character[getgenv().Evolution.Resolver["PredictionSettings"].HitPart].Velocity
end

while Evolution.AutoReload == true and game:GetService("RunService").Heartbeat:Wait() do
if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then
            if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild("Ammo") then
                if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild("Ammo").Value <= 0 then
                    game:GetService("ReplicatedStorage").MainEvent:FireServer("Reload", game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool")) 
                    wait(1)
                end
            end
        end
end