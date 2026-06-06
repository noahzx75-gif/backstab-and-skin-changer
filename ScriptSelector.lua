-- // Script Selector — Backstab & Skin Changer
-- // Selector GUI with 3 options: Backstab, Skin Changer, Both

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local C = {
    BG = Color3.fromRGB(15, 15, 20),
    SURFACE = Color3.fromRGB(25, 25, 32),
    PRIMARY = Color3.fromRGB(124, 58, 237),
    PRIMARY_HOVER = Color3.fromRGB(139, 92, 246),
    SUCCESS = Color3.fromRGB(16, 185, 129),
    DANGER = Color3.fromRGB(239, 68, 68),
    TEXT = Color3.fromRGB(248, 250, 252),
    TEXT_DIM = Color3.fromRGB(148, 163, 184),
    ACCENT_RED = Color3.fromRGB(200, 40, 40),
    ACCENT_RED_HOVER = Color3.fromRGB(255, 80, 80),
    ACCENT_BLUE = Color3.fromRGB(0, 150, 255),
    ACCENT_BLUE_HOVER = Color3.fromRGB(80, 180, 255),
    ACCENT_PURPLE = Color3.fromRGB(180, 80, 255),
    ACCENT_PURPLE_HOVER = Color3.fromRGB(200, 120, 255)
}

local function Tween(inst, props, dur)
    return TweenService:Create(inst, TweenInfo.new(dur or 0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), props)
end

local function Corner(parent, r)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, r or 6)
    c.Parent = parent
    return c
end

local function Stroke(parent, col)
    local s = Instance.new("UIStroke")
    s.Color = col or C.PRIMARY
    s.Thickness = 1.2
    s.Transparency = 0.85
    s.Parent = parent
    return s
end

-- ==================== GUI ====================

local SG = Instance.new("ScreenGui")
SG.Name = "ScriptSelector"
SG.Parent = game.CoreGui
SG.ResetOnSpawn = false
SG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local F = Instance.new("Frame")
F.Size = UDim2.new(0, 260, 0, 280)
F.Position = UDim2.new(0.5, -130, 0.5, -140)
F.BackgroundColor3 = C.BG
F.BorderSizePixel = 0
F.Active = true
F.ClipsDescendants = true
F.Parent = SG

Corner(F, 12)
Stroke(F)

-- Top bar
local Top = Instance.new("Frame")
Top.Size = UDim2.new(1, 0, 0, 32)
Top.BackgroundColor3 = C.SURFACE
Top.BorderSizePixel = 0
Top.Parent = F

Corner(Top, 12)

local TopFix = Instance.new("Frame")
TopFix.Size = UDim2.new(1, 0, 0, 12)
TopFix.Position = UDim2.new(0, 0, 1, -12)
TopFix.BackgroundColor3 = C.SURFACE
TopFix.BorderSizePixel = 0
TopFix.Parent = Top

-- Accent
local Accent = Instance.new("Frame")
Accent.Size = UDim2.new(0, 40, 0, 2)
Accent.Position = UDim2.new(0, 12, 1, -1)
Accent.BackgroundColor3 = C.PRIMARY
Accent.BorderSizePixel = 0
Accent.Parent = Top

-- Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -60, 1, 0)
Title.Position = UDim2.new(0, 12, 0, 0)
Title.Text = "SCRIPT SELECTOR"
Title.TextColor3 = C.TEXT
Title.TextSize = 12
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.BackgroundTransparency = 1
Title.Parent = Top

-- Close X
local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0, 24, 0, 24)
Close.Position = UDim2.new(1, -30, 0.5, -12)
Close.Text = "×"
Close.TextColor3 = C.DANGER
Close.TextSize = 18
Close.Font = Enum.Font.GothamBold
Close.BackgroundTransparency = 1
Close.Parent = Top

-- Subtitle
local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1, 0, 0, 16)
Subtitle.Position = UDim2.new(0, 0, 0, 38)
Subtitle.Text = "Choose a script to execute"
Subtitle.TextColor3 = C.TEXT_DIM
Subtitle.TextSize = 10
Subtitle.Font = Enum.Font.GothamMedium
Subtitle.TextXAlignment = Enum.TextXAlignment.Center
Subtitle.BackgroundTransparency = 1
Subtitle.Parent = F

-- Button container
local BtnContainer = Instance.new("Frame")
BtnContainer.Size = UDim2.new(1, -20, 1, -70)
BtnContainer.Position = UDim2.new(0, 10, 0, 58)
BtnContainer.BackgroundTransparency = 1
BtnContainer.Parent = F

-- Backstab Button
local BackstabBtn = Instance.new("TextButton")
BackstabBtn.Name = "BackstabBtn"
BackstabBtn.Size = UDim2.new(1, 0, 0, 52)
BackstabBtn.Position = UDim2.new(0, 0, 0, 0)
BackstabBtn.Text = "BACKSTAB SCRIPT"
BackstabBtn.TextColor3 = C.TEXT
BackstabBtn.TextSize = 13
BackstabBtn.Font = Enum.Font.GothamBold
BackstabBtn.BackgroundColor3 = C.ACCENT_RED
BackstabBtn.BorderSizePixel = 0
BackstabBtn.AutoButtonColor = false
BackstabBtn.Parent = BtnContainer

Corner(BackstabBtn, 10)
Stroke(BackstabBtn, C.ACCENT_RED_HOVER)

-- Backstab icon
local BackstabIcon = Instance.new("TextLabel")
BackstabIcon.Size = UDim2.new(0, 30, 0, 30)
BackstabIcon.Position = UDim2.new(0, 12, 0.5, -15)
BackstabIcon.Text = "🗡️"
BackstabIcon.TextSize = 18
BackstabIcon.BackgroundTransparency = 1
BackstabIcon.Parent = BackstabBtn

-- Backstab desc
local BackstabDesc = Instance.new("TextLabel")
BackstabDesc.Size = UDim2.new(1, -60, 0, 14)
BackstabDesc.Position = UDim2.new(0, 44, 0, 32)
BackstabDesc.Text = "Auto backstab with smooth glide"
BackstabDesc.TextColor3 = Color3.fromRGB(255, 180, 180)
BackstabDesc.TextSize = 9
BackstabDesc.Font = Enum.Font.Gotham
BackstabDesc.TextXAlignment = Enum.TextXAlignment.Left
BackstabDesc.BackgroundTransparency = 1
BackstabDesc.Parent = BackstabBtn

-- Skin Changer Button
local SkinBtn = Instance.new("TextButton")
SkinBtn.Name = "SkinBtn"
SkinBtn.Size = UDim2.new(1, 0, 0, 52)
SkinBtn.Position = UDim2.new(0, 0, 0, 64)
SkinBtn.Text = "SKIN CHANGER"
SkinBtn.TextColor3 = C.TEXT
SkinBtn.TextSize = 13
SkinBtn.Font = Enum.Font.GothamBold
SkinBtn.BackgroundColor3 = C.ACCENT_BLUE
SkinBtn.BorderSizePixel = 0
SkinBtn.AutoButtonColor = false
SkinBtn.Parent = BtnContainer

Corner(SkinBtn, 10)
Stroke(SkinBtn, C.ACCENT_BLUE_HOVER)

-- Skin icon
local SkinIcon = Instance.new("TextLabel")
SkinIcon.Size = UDim2.new(0, 30, 0, 30)
SkinIcon.Position = UDim2.new(0, 12, 0.5, -15)
SkinIcon.Text = "🎨"
SkinIcon.TextSize = 18
SkinIcon.BackgroundTransparency = 1
SkinIcon.Parent = SkinBtn

-- Skin desc
local SkinDesc = Instance.new("TextLabel")
SkinDesc.Size = UDim2.new(1, -60, 0, 14)
SkinDesc.Position = UDim2.new(0, 44, 0, 32)
SkinDesc.Text = "Change skins with one click"
SkinDesc.TextColor3 = Color3.fromRGB(180, 220, 255)
SkinDesc.TextSize = 9
SkinDesc.Font = Enum.Font.Gotham
SkinDesc.TextXAlignment = Enum.TextXAlignment.Left
SkinDesc.BackgroundTransparency = 1
SkinDesc.Parent = SkinBtn

-- Both Button
local BothBtn = Instance.new("TextButton")
BothBtn.Name = "BothBtn"
BothBtn.Size = UDim2.new(1, 0, 0, 52)
BothBtn.Position = UDim2.new(0, 0, 0, 128)
BothBtn.Text = "BOTH SCRIPTS"
BothBtn.TextColor3 = C.TEXT
BothBtn.TextSize = 13
BothBtn.Font = Enum.Font.GothamBold
BothBtn.BackgroundColor3 = C.ACCENT_PURPLE
BothBtn.BorderSizePixel = 0
BothBtn.AutoButtonColor = false
BothBtn.Parent = BtnContainer

Corner(BothBtn, 10)
Stroke(BothBtn, C.ACCENT_PURPLE_HOVER)

-- Both icon
local BothIcon = Instance.new("TextLabel")
BothIcon.Size = UDim2.new(0, 30, 0, 30)
BothIcon.Position = UDim2.new(0, 12, 0.5, -15)
BothIcon.Text = "⚡"
BothIcon.TextSize = 18
BothIcon.BackgroundTransparency = 1
BothIcon.Parent = BothBtn

-- Both desc
local BothDesc = Instance.new("TextLabel")
BothDesc.Size = UDim2.new(1, -60, 0, 14)
BothDesc.Position = UDim2.new(0, 44, 0, 32)
BothDesc.Text = "Execute both scripts at once"
BothDesc.TextColor3 = Color3.fromRGB(220, 180, 255)
BothDesc.TextSize = 9
BothDesc.Font = Enum.Font.Gotham
BothDesc.TextXAlignment = Enum.TextXAlignment.Left
BothDesc.BackgroundTransparency = 1
BothDesc.Parent = BothBtn

-- Footer
local Foot = Instance.new("TextLabel")
Foot.Size = UDim2.new(1, 0, 0, 14)
Foot.Position = UDim2.new(0, 0, 1, -18)
Foot.Text = "v1.0 • Script Selector"
Foot.TextColor3 = C.TEXT_DIM
Foot.TextSize = 8
Foot.Font = Enum.Font.Gotham
Foot.TextXAlignment = Enum.TextXAlignment.Center
Foot.BackgroundTransparency = 1
Foot.Parent = F

-- ==================== DRAG ====================

local drag, dragStart, startPos = false, nil, nil

Top.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        drag = true
        dragStart = input.Position
        startPos = F.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then drag = false end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if drag and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        Tween(F, {
            Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
                               startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        }, 0.08):Play()
    end
end)

-- ==================== ENTRANCE ====================

F.Size = UDim2.new(0, 0, 0, 0)
F.Position = UDim2.new(0.5, 0, 0.5, 0)
F.BackgroundTransparency = 1

Tween(F, {
    Size = UDim2.new(0, 260, 0, 280),
    Position = UDim2.new(0.5, -130, 0.5, -140),
    BackgroundTransparency = 0
}, 0.5):Play()

-- ==================== CLOSE ====================

Close.MouseEnter:Connect(function() Tween(Close, {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play() end)
Close.MouseLeave:Connect(function() Tween(Close, {TextColor3 = C.DANGER}):Play() end)

Close.MouseButton1Click:Connect(function()
    local t = Tween(F, {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0), BackgroundTransparency = 1}, 0.35)
    t.Completed:Connect(function() SG:Destroy() end)
    t:Play()
end)

-- ==================== BUTTON ANIMATIONS ====================

-- Backstab hover
BackstabBtn.MouseEnter:Connect(function() Tween(BackstabBtn, {BackgroundColor3 = C.ACCENT_RED_HOVER}):Play() end)
BackstabBtn.MouseLeave:Connect(function() Tween(BackstabBtn, {BackgroundColor3 = C.ACCENT_RED}):Play() end)

-- Skin hover
SkinBtn.MouseEnter:Connect(function() Tween(SkinBtn, {BackgroundColor3 = C.ACCENT_BLUE_HOVER}):Play() end)
SkinBtn.MouseLeave:Connect(function() Tween(SkinBtn, {BackgroundColor3 = C.ACCENT_BLUE}):Play() end)

-- Both hover
BothBtn.MouseEnter:Connect(function() Tween(BothBtn, {BackgroundColor3 = C.ACCENT_PURPLE_HOVER}):Play() end)
BothBtn.MouseLeave:Connect(function() Tween(BothBtn, {BackgroundColor3 = C.ACCENT_PURPLE}):Play() end)

-- ==================== SCRIPT CONTENTS ====================

local backstabScript = [==[
-- // Roblox Rivals — Auto Backstab Script v26.1
-- // Автор: palofsc
-- // Назначение: Smooth glide дальше за спину врага (offsetDistance увеличен), тело и камера принудительно смотрят на спину

-- // Сервисы
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local Camera = Workspace.CurrentCamera

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Humanoid = Character:WaitForChild("Humanoid")

-- // Конфигурация
local CONFIG = {
    glideSpeed = 0.15,
    offsetDistance = 6.0, -- // УВЕЛИЧЕНО: дальше за спину врага
    maxRadius = 200,
    defaultRadius = 50,
    camHeight = 2.5,
    camDistance = 7.0, -- // УВЕЛИЧЕНО: камера дальше для лучшего вида
}

-- // Состояние
local currentRadius = CONFIG.defaultRadius
local isGliding = false
local guiLocked = false

-- // Функция: найти ближайшего врага
local function getNearestEnemy(radius)
    local nearest = nil
    local minDist = radius

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local targetHRP = player.Character:FindFirstChild("HumanoidRootPart")
            local targetHumanoid = player.Character:FindFirstChild("Humanoid")

            if targetHRP and targetHumanoid and targetHumanoid.Health > 0 then
                local dist = (HumanoidRootPart.Position - targetHRP.Position).Magnitude
                if dist < minDist then
                    minDist = dist
                    nearest = targetHRP
                end
            end
        end
    end

    return nearest
end

-- // Функция: принудительный поворот ВСЕГО тела и камеры на спину врага
local function forceFaceEnemyBack(targetHRP)
    if not targetHRP or not targetHRP.Parent then return end

    local targetHumanoid = targetHRP.Parent:FindFirstChild("Humanoid")
    if not targetHumanoid or targetHumanoid.Health <= 0 then return end

    local liveCF = targetHRP.CFrame
    local backPos = liveCF.Position - (liveCF.LookVector * CONFIG.offsetDistance)
    local targetBodyCF = CFrame.new(backPos, liveCF.Position)

    -- // HumanoidRootPart — стоим за спиной, смотрим НА спину
    HumanoidRootPart.CFrame = targetBodyCF

    -- // ВСЕ части тела поворачиваются на спину врага
    for _, part in ipairs(Character:GetDescendants()) do
        if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
            local offset = part.Position - HumanoidRootPart.Position
            local newPos = backPos + (targetBodyCF.LookVector * offset.Z) + (targetBodyCF.RightVector * offset.X) + (targetBodyCF.UpVector * offset.Y)
            part.CFrame = CFrame.new(newPos, liveCF.Position)
        end
    end

    -- // Сброс Motor6D для выравнивания arms/legs
    for _, joint in ipairs(Character:GetDescendants()) do
        if joint:IsA("Motor6D") then
            pcall(function()
                local pos0 = joint.C0.Position
                local pos1 = joint.C1.Position
                joint.C0 = CFrame.new(pos0) * CFrame.Angles(0, 0, 0)
                joint.C1 = CFrame.new(pos1) * CFrame.Angles(0, 0, 0)
            end)
        end
    end

    -- // Weld arms принудительно
    for _, weld in ipairs(Character:GetDescendants()) do
        if weld:IsA("Weld") or weld:IsA("WeldConstraint") then
            pcall(function()
                if weld.Part1 and (weld.Part1.Name:lower():find("arm") or weld.Part1.Name:lower():find("hand")) then
                    weld.Part1.CFrame = CFrame.new(weld.Part1.Position, liveCF.Position)
                end
            end)
        end
    end

    -- // КАМЕРА: принудительно смотрит на спину врага
    local camPos = backPos + Vector3.new(0, CONFIG.camHeight, 0) - (liveCF.LookVector * CONFIG.camDistance)
    Camera.CFrame = CFrame.new(camPos, liveCF.Position)
end

-- // Функция: smooth glide за спину врага
local function glideBehind(targetHRP)
    if not targetHRP or not targetHRP.Parent then
        isGliding = false
        return
    end

    local targetHumanoid = targetHRP.Parent:FindFirstChild("Humanoid")
    if not targetHumanoid or targetHumanoid.Health <= 0 then
        isGliding = false
        return
    end

    local initialCF = targetHRP.CFrame
    local backPos = initialCF.Position - (initialCF.LookVector * CONFIG.offsetDistance)
    local targetCF = CFrame.new(backPos, initialCF.Position)

    -- // Smooth glide tween
    local charTween = TweenService:Create(HumanoidRootPart, TweenInfo.new(CONFIG.glideSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { CFrame = targetCF })
    charTween:Play()
    charTween.Completed:Wait()

    -- // Фиксация: тело и камера смотрят на спину
    forceFaceEnemyBack(targetHRP)

    isGliding = false
end

-- // Функция: backstab
local function executeBackstab()
    if isGliding then return end
    isGliding = true

    local target = getNearestEnemy(currentRadius)
    if target then
        task.spawn(function()
            glideBehind(target)
        end)
    else
        isGliding = false
    end
end

-- // ==================== GUI: BACKSTAB ====================

local backstabGui = Instance.new("ScreenGui")
backstabGui.Name = "BackstabBtnGUI"
backstabGui.ResetOnSpawn = false
backstabGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
backstabGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local backstabFrame = Instance.new("Frame")
backstabFrame.Name = "BackstabFrame"
backstabFrame.Size = UDim2.new(0, 100, 0, 40)
backstabFrame.Position = UDim2.new(0.5, -50, 0.5, -20)
backstabFrame.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
backstabFrame.BackgroundTransparency = 0.1
backstabFrame.BorderSizePixel = 0
backstabFrame.Active = true
backstabFrame.Selectable = true
backstabFrame.Parent = backstabGui

local bsCorner = Instance.new("UICorner")
bsCorner.CornerRadius = UDim.new(0, 8)
bsCorner.Parent = backstabFrame

local bsStroke = Instance.new("UIStroke")
bsStroke.Color = Color3.fromRGB(255, 80, 80)
bsStroke.Thickness = 1.5
bsStroke.Parent = backstabFrame

local backstabBtn = Instance.new("TextButton")
backstabBtn.Name = "BackstabBtn"
backstabBtn.Size = UDim2.new(1, -30, 1, 0)
backstabBtn.Position = UDim2.new(0, 0, 0, 0)
backstabBtn.BackgroundTransparency = 1
backstabBtn.Text = "BACKSTAB"
backstabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
backstabBtn.TextSize = 13
backstabBtn.Font = Enum.Font.GothamBold
backstabBtn.Parent = backstabFrame

backstabBtn.MouseButton1Click:Connect(function()
    executeBackstab()
end)

local lockBtn = Instance.new("TextButton")
lockBtn.Name = "LockBtn"
lockBtn.Size = UDim2.new(0, 26, 0, 26)
lockBtn.Position = UDim2.new(1, -28, 0, 2)
lockBtn.BackgroundTransparency = 1
lockBtn.Text = "🔓"
lockBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
lockBtn.TextSize = 14
lockBtn.Font = Enum.Font.GothamBold
lockBtn.Parent = backstabFrame

lockBtn.MouseButton1Click:Connect(function()
    guiLocked = not guiLocked
    lockBtn.Text = guiLocked and "🔒" or "🔓"
    lockBtn.TextColor3 = guiLocked and Color3.fromRGB(0, 255, 100) or Color3.fromRGB(255, 255, 255)
end)

-- // DRAG: BACKSTAB
local isDraggingBS = false
local dragStartBS = nil
local frameStartBS = nil

backstabFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        if input.Target == lockBtn or input.Target == backstabBtn then return end
        if guiLocked then return end
        isDraggingBS = true
        dragStartBS = Vector2.new(input.Position.X, input.Position.Y)
        frameStartBS = backstabFrame.Position
    end
end)

backstabFrame.InputChanged:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and isDraggingBS then
        local delta = Vector2.new(input.Position.X, input.Position.Y) - dragStartBS
        backstabFrame.Position = UDim2.new(frameStartBS.X.Scale, frameStartBS.X.Offset + delta.X, frameStartBS.Y.Scale, frameStartBS.Y.Offset + delta.Y)
    end
end)

backstabFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        isDraggingBS = false
    end
end)

-- // ==================== GUI: РАДИУС ====================

local radiusGui = Instance.new("ScreenGui")
radiusGui.Name = "RadiusGUI"
radiusGui.ResetOnSpawn = false
radiusGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
radiusGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local radiusFrame = Instance.new("Frame")
radiusFrame.Name = "RadiusFrame"
radiusFrame.Size = UDim2.new(0, 120, 0, 50)
radiusFrame.Position = UDim2.new(0.5, 55, 0.5, -25)
radiusFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
radiusFrame.BackgroundTransparency = 0.1
radiusFrame.BorderSizePixel = 0
radiusFrame.Active = true
radiusFrame.Selectable = true
radiusFrame.Parent = radiusGui

local radiusCorner = Instance.new("UICorner")
radiusCorner.CornerRadius = UDim.new(0, 8)
radiusCorner.Parent = radiusFrame

local radiusStroke = Instance.new("UIStroke")
radiusStroke.Color = Color3.fromRGB(50, 50, 50)
radiusStroke.Thickness = 1
radiusStroke.Parent = radiusFrame

local radiusTitle = Instance.new("TextLabel")
radiusTitle.Size = UDim2.new(1, 0, 0, 14)
radiusTitle.Position = UDim2.new(0, 0, 0, 2)
radiusTitle.BackgroundTransparency = 1
radiusTitle.Text = "RADIUS"
radiusTitle.TextColor3 = Color3.fromRGB(180, 180, 180)
radiusTitle.TextSize = 9
radiusTitle.Font = Enum.Font.GothamBold
radiusTitle.Parent = radiusFrame

local sliderFrame = Instance.new("Frame")
sliderFrame.Size = UDim2.new(1, -10, 0, 6)
sliderFrame.Position = UDim2.new(0, 5, 0, 18)
sliderFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
sliderFrame.BorderSizePixel = 0
sliderFrame.Parent = radiusFrame

local sliderCorner = Instance.new("UICorner")
sliderCorner.CornerRadius = UDim.new(1, 0)
sliderCorner.Parent = sliderFrame

local sliderFill = Instance.new("Frame")
sliderFill.Size = UDim2.new(currentRadius / CONFIG.maxRadius, 0, 1, 0)
sliderFill.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
sliderFill.BorderSizePixel = 0
sliderFill.Parent = sliderFrame

local fillCorner = Instance.new("UICorner")
fillCorner.CornerRadius = UDim.new(1, 0)
fillCorner.Parent = sliderFill

local sliderKnob = Instance.new("Frame")
sliderKnob.Size = UDim2.new(0, 10, 0, 10)
sliderKnob.Position = UDim2.new(currentRadius / CONFIG.maxRadius, -5, 0.5, -5)
sliderKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
sliderKnob.BorderSizePixel = 0
sliderKnob.Parent = sliderFrame

local knobCorner = Instance.new("UICorner")
knobCorner.CornerRadius = UDim.new(1, 0)
knobCorner.Parent = sliderKnob

local valueLabel = Instance.new("TextLabel")
valueLabel.Size = UDim2.new(1, 0, 0, 12)
valueLabel.Position = UDim2.new(0, 0, 0, 28)
valueLabel.BackgroundTransparency = 1
valueLabel.Text = tostring(currentRadius)
valueLabel.TextColor3 = Color3.fromRGB(0, 150, 255)
valueLabel.TextSize = 11
valueLabel.Font = Enum.Font.GothamBold
valueLabel.Parent = radiusFrame

local function updateSlider(input)
    local sliderPos = sliderFrame.AbsolutePosition.X
    local sliderWidth = sliderFrame.AbsoluteSize.X
    local relativeX = math.clamp((input.Position.X - sliderPos) / sliderWidth, 0, 1)
    currentRadius = math.floor(relativeX * CONFIG.maxRadius)
    if currentRadius < 1 then currentRadius = 1 end
    sliderFill.Size = UDim2.new(relativeX, 0, 1, 0)
    sliderKnob.Position = UDim2.new(relativeX, -5, 0.5, -5)
    valueLabel.Text = tostring(currentRadius)
end

-- // DRAG: РАДИУС
local isDraggingR = false
local dragStartR = nil
local frameStartR = nil

radiusFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        if input.Target == sliderKnob then return end
        isDraggingR = true
        dragStartR = Vector2.new(input.Position.X, input.Position.Y)
        frameStartR = radiusFrame.Position
    end
end)

radiusFrame.InputChanged:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and isDraggingR then
        local delta = Vector2.new(input.Position.X, input.Position.Y) - dragStartR
        radiusFrame.Position = UDim2.new(frameStartR.X.Scale, frameStartR.X.Offset + delta.X, frameStartR.Y.Scale, frameStartR.Y.Offset + delta.Y)
    end
end)

radiusFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        isDraggingR = false
    end
end)

sliderKnob.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        local conn
        conn = UserInputService.InputChanged:Connect(function(changedInput)
            if changedInput == input then
                updateSlider(changedInput)
            end
        end)
        UserInputService.InputEnded:Connect(function(endedInput)
            if endedInput == input then
                conn:Disconnect()
            end
        end)
    end
end)

sliderFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        updateSlider(input)
    end
end)

-- // Input: Aim button triggers backstab
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end

    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        executeBackstab()
        return
    end

    if input.UserInputType == Enum.UserInputType.Gamepad1 then
        if input.KeyCode == Enum.KeyCode.ButtonL2 then
            executeBackstab()
            return
        end
    end

    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == Enum.KeyCode.A then
            if not UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) and
               not UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) and
               not UserInputService:IsKeyDown(Enum.KeyCode.W) and
               not UserInputService:IsKeyDown(Enum.KeyCode.S) and
               not UserInputService:IsKeyDown(Enum.KeyCode.D) then
                executeBackstab()
            end
            return
        end
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Gamepad1 and input.KeyCode == Enum.KeyCode.ButtonL2 then
        if input.Position.Z > 0.5 then
            executeBackstab()
        end
    end
end)

-- // Респавн
LocalPlayer.CharacterAdded:Connect(function(newChar)
    Character = newChar
    HumanoidRootPart = newChar:WaitForChild("HumanoidRootPart")
    Humanoid = newChar:WaitForChild("Humanoid")
end)

print("[palofsc] v26.1 loaded | Further behind enemy (6.0) | Smooth glide | Body + Camera forced to enemy back | Both draggable")

]==]

local skinChangerScript = [==[
-- // Unknowns Skin Changer - Ultra Compact Pro
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local C = {
    BG = Color3.fromRGB(15, 15, 20),
    SURFACE = Color3.fromRGB(25, 25, 32),
    PRIMARY = Color3.fromRGB(124, 58, 237),
    PRIMARY_HOVER = Color3.fromRGB(139, 92, 246),
    SUCCESS = Color3.fromRGB(16, 185, 129),
    DANGER = Color3.fromRGB(239, 68, 68),
    TEXT = Color3.fromRGB(248, 250, 252),
    TEXT_DIM = Color3.fromRGB(148, 163, 184)
}

local function Tween(inst, props, dur)
    return TweenService:Create(inst, TweenInfo.new(dur or 0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), props)
end

local function Corner(parent, r)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, r or 6)
    c.Parent = parent
    return c
end

local function Stroke(parent, col)
    local s = Instance.new("UIStroke")
    s.Color = col or C.PRIMARY
    s.Thickness = 1.2
    s.Transparency = 0.85
    s.Parent = parent
    return s
end

-- GUI
local SG = Instance.new("ScreenGui")
SG.Name = "UnknownsSkinChanger"
SG.Parent = game.CoreGui
SG.ResetOnSpawn = false
SG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Frame: 220 x 120
local F = Instance.new("Frame")
F.Size = UDim2.new(0, 220, 0, 120)
F.Position = UDim2.new(0.5, -110, 0.5, -60)
F.BackgroundColor3 = C.BG
F.BorderSizePixel = 0
F.Active = true
F.ClipsDescendants = true
F.Parent = SG

Corner(F, 10)
Stroke(F)

-- Top bar
local Top = Instance.new("Frame")
Top.Size = UDim2.new(1, 0, 0, 28)
Top.BackgroundColor3 = C.SURFACE
Top.BorderSizePixel = 0
Top.Parent = F

Corner(Top, 10)

local TopFix = Instance.new("Frame")
TopFix.Size = UDim2.new(1, 0, 0, 10)
TopFix.Position = UDim2.new(0, 0, 1, -10)
TopFix.BackgroundColor3 = C.SURFACE
TopFix.BorderSizePixel = 0
TopFix.Parent = Top

-- Mini accent
local Accent = Instance.new("Frame")
Accent.Size = UDim2.new(0, 30, 0, 2)
Accent.Position = UDim2.new(0, 10, 1, -1)
Accent.BackgroundColor3 = C.PRIMARY
Accent.BorderSizePixel = 0
Accent.Parent = Top

-- Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -60, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.Text = "UNKNOWNS SKIN CHANGER"
Title.TextColor3 = C.TEXT
Title.TextSize = 11
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.BackgroundTransparency = 1
Title.Parent = Top

-- Close X
local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0, 20, 0, 20)
Close.Position = UDim2.new(1, -26, 0.5, -10)
Close.Text = "×"
Close.TextColor3 = C.DANGER
Close.TextSize = 16
Close.Font = Enum.Font.GothamBold
Close.BackgroundTransparency = 1
Close.Parent = Top

-- Status dot
local Dot = Instance.new("Frame")
Dot.Size = UDim2.new(0, 5, 0, 5)
Dot.Position = UDim2.new(0, 12, 0, 40)
Dot.BackgroundColor3 = C.PRIMARY
Dot.BorderSizePixel = 0
Dot.Parent = F

Corner(Dot, 3)

local Status = Instance.new("TextLabel")
Status.Size = UDim2.new(1, -30, 0, 14)
Status.Position = UDim2.new(0, 22, 0, 35)
Status.Text = "Ready"
Status.TextColor3 = C.TEXT_DIM
Status.TextSize = 10
Status.Font = Enum.Font.GothamMedium
Status.TextXAlignment = Enum.TextXAlignment.Left
Status.BackgroundTransparency = 1
Status.Parent = F

-- Main Button
local Btn = Instance.new("TextButton")
Btn.Size = UDim2.new(1, -20, 0, 34)
Btn.Position = UDim2.new(0, 10, 0, 62)
Btn.Text = "EXECUTE"
Btn.TextColor3 = C.TEXT
Btn.TextSize = 12
Btn.Font = Enum.Font.GothamBold
Btn.BackgroundColor3 = C.PRIMARY
Btn.BorderSizePixel = 0
Btn.AutoButtonColor = false
Btn.Parent = F

Corner(Btn, 8)

-- Shine
local Shine = Instance.new("Frame")
Shine.Size = UDim2.new(0, 60, 1, 0)
Shine.Position = UDim2.new(0, -60, 0, 0)
Shine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Shine.BackgroundTransparency = 0.92
Shine.BorderSizePixel = 0
Shine.Rotation = 15
Shine.Parent = Btn

-- Footer
local Foot = Instance.new("TextLabel")
Foot.Size = UDim2.new(1, 0, 0, 14)
Foot.Position = UDim2.new(0, 0, 1, -16)
Foot.Text = "v2.0 • Secure"
Foot.TextColor3 = C.TEXT_DIM
Foot.TextSize = 8
Foot.Font = Enum.Font.Gotham
Foot.TextXAlignment = Enum.TextXAlignment.Center
Foot.BackgroundTransparency = 1
Foot.Parent = F

-- Draggable
local drag, dragStart, startPos = false, nil, nil

Top.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        drag = true
        dragStart = input.Position
        startPos = F.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then drag = false end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if drag and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        Tween(F, {
            Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
                               startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        }, 0.08):Play()
    end
end)

-- Entrance
F.Size = UDim2.new(0, 0, 0, 0)
F.Position = UDim2.new(0.5, 0, 0.5, 0)
F.BackgroundTransparency = 1

Tween(F, {
    Size = UDim2.new(0, 220, 0, 120),
    Position = UDim2.new(0.5, -110, 0.5, -60),
    BackgroundTransparency = 0
}, 0.5):Play()

-- Close
Close.MouseEnter:Connect(function() Tween(Close, {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play() end)
Close.MouseLeave:Connect(function() Tween(Close, {TextColor3 = C.DANGER}):Play() end)

Close.MouseButton1Click:Connect(function()
    local t = Tween(F, {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0), BackgroundTransparency = 1}, 0.35)
    t.Completed:Connect(function() SG:Destroy() end)
    t:Play()
end)

-- Button Logic
local processing = false

Btn.MouseEnter:Connect(function()
    if not processing then Tween(Btn, {BackgroundColor3 = C.PRIMARY_HOVER}):Play() end
end)

Btn.MouseLeave:Connect(function()
    if not processing then Tween(Btn, {BackgroundColor3 = C.PRIMARY}):Play() end
end)

Btn.MouseButton1Down:Connect(function()
    if not processing then Tween(Btn, {Size = UDim2.new(1, -24, 0, 30), Position = UDim2.new(0, 12, 0, 64)}):Play() end
end)

Btn.MouseButton1Up:Connect(function()
    if not processing then Tween(Btn, {Size = UDim2.new(1, -20, 0, 34), Position = UDim2.new(0, 10, 0, 62)}):Play() end
end)

Btn.MouseButton1Click:Connect(function()
    if processing then return end
    processing = true

    Status.Text = "Executing..."
    Status.TextColor3 = C.PRIMARY
    Dot.BackgroundColor3 = C.SUCCESS
    Btn.Text = "..."
    Tween(Btn, {BackgroundColor3 = C.SUCCESS}):Play()

    task.delay(1.5, function()
        Status.Text = "Done"
        Btn.Text = "✓ DONE"

        local ok, res = pcall(function()
            return loadstring(game:HttpGet("https://pastefy.app/6ElsMLeb/raw"))()
        end)

        if not ok then warn("Load error: " .. tostring(res)) end

        task.delay(2.5, function()
            if SG.Parent then
                Btn.Text = "EXECUTE"
                Tween(Btn, {BackgroundColor3 = C.PRIMARY}):Play()
                Status.Text = "Ready"
                Status.TextColor3 = C.TEXT_DIM
                Dot.BackgroundColor3 = C.PRIMARY
                processing = false
            end
        end)
    end)
end)

-- Ambient
task.spawn(function()
    while SG.Parent do
        if not processing then
            Tween(Dot, {BackgroundTransparency = 0.4}, 0.8):Play()
            task.wait(0.8)
            Tween(Dot, {BackgroundTransparency = 0}, 0.8):Play()
            task.wait(0.8)
        end
        task.wait(0.3)
    end
end)

task.spawn(function()
    while SG.Parent do
        task.wait(3.5)
        if not processing then
            Shine.Position = UDim2.new(0, -60, 0, 0)
            Tween(Shine, {Position = UDim2.new(1, 30, 0, 0)}, 0.8):Play()
        end
    end
end)

print("✓ Unknowns Skin Changer loaded | 220×120 | Pro")

]==]

-- ==================== EXECUTION LOGIC ====================

local function executeBackstab()
    local ok, err = pcall(function()
        loadstring(backstabScript)()
    end)
    if not ok then warn("Backstab Script Error: " .. tostring(err)) end
end

local function executeSkinChanger()
    local ok, err = pcall(function()
        loadstring(skinChangerScript)()
    end)
    if not ok then warn("Skin Changer Error: " .. tostring(err)) end
end

-- Backstab click
BackstabBtn.MouseButton1Click:Connect(function()
    BackstabBtn.Text = "LOADING..."
    Tween(BackstabBtn, {BackgroundColor3 = C.SUCCESS}):Play()
    task.delay(0.5, function()
        executeBackstab()
        BackstabBtn.Text = "✓ LOADED"
        task.delay(1.5, function()
            BackstabBtn.Text = "BACKSTAB SCRIPT"
            Tween(BackstabBtn, {BackgroundColor3 = C.ACCENT_RED}):Play()
        end)
    end)
end)

-- Skin Changer click
SkinBtn.MouseButton1Click:Connect(function()
    SkinBtn.Text = "LOADING..."
    Tween(SkinBtn, {BackgroundColor3 = C.SUCCESS}):Play()
    task.delay(0.5, function()
        executeSkinChanger()
        SkinBtn.Text = "✓ LOADED"
        task.delay(1.5, function()
            SkinBtn.Text = "SKIN CHANGER"
            Tween(SkinBtn, {BackgroundColor3 = C.ACCENT_BLUE}):Play()
        end)
    end)
end)

-- Both click
BothBtn.MouseButton1Click:Connect(function()
    BothBtn.Text = "LOADING BOTH..."
    Tween(BothBtn, {BackgroundColor3 = C.SUCCESS}):Play()
    task.delay(0.5, function()
        executeBackstab()
        executeSkinChanger()
        BothBtn.Text = "✓ BOTH LOADED"
        task.delay(1.5, function()
            BothBtn.Text = "BOTH SCRIPTS"
            Tween(BothBtn, {BackgroundColor3 = C.ACCENT_PURPLE}):Play()
        end)
    end)
end)

print("✓ Script Selector loaded | 260×280 | Backstab + Skin Changer + Both")
