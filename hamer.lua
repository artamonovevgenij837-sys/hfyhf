-- hamer client
local _env = (typeof(getgenv) == "function" and getgenv()) or _G
if not _env.__HAMER_AUTH then
    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    local player = Players.LocalPlayer
    local pg = player:WaitForChild("PlayerGui")

    local KEYS = {["HAMER-2026"] = true, ["HAMER-FREE"] = true, ["HAMER-TEST"] = true}

    local gui = Instance.new("ScreenGui")
    gui.Name = "HamerAuth"
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true
    gui.DisplayOrder = 9999
    gui.Parent = pg

    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundColor3 = Color3.fromRGB(4, 6, 12)
    bg.BackgroundTransparency = 0.35
    bg.BorderSizePixel = 0
    bg.Parent = gui

    local panel = Instance.new("Frame")
    panel.Size = UDim2.new(0, 430, 0, 330)
    panel.Position = UDim2.new(0.5, -215, 0.5, -165)
    panel.BackgroundColor3 = Color3.fromRGB(18, 22, 34)
    panel.BackgroundTransparency = 0.18
    panel.BorderSizePixel = 0
    panel.Parent = gui

    local pc = Instance.new("UICorner")
    pc.CornerRadius = UDim.new(0, 22)
    pc.Parent = panel

    local ps = Instance.new("UIStroke")
    ps.Color = Color3.fromRGB(255, 255, 255)
    ps.Transparency = 0.75
    ps.Thickness = 1
    ps.Parent = panel

    local pg2 = Instance.new("UIGradient")
    pg2.Rotation = 125
    pg2.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(90, 180, 255))
    pg2.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.82),
        NumberSequenceKeypoint.new(0.5, 0.92),
        NumberSequenceKeypoint.new(1, 0.98)
    })
    pg2.Parent = panel

    local logo = Instance.new("TextLabel")
    logo.Text = "H"
    logo.Font = Enum.Font.ArialBlack
    logo.TextSize = 78
    logo.TextColor3 = Color3.fromRGB(255, 255, 255)
    logo.Size = UDim2.new(1, 0, 0, 100)
    logo.Position = UDim2.new(0, 0, 0, 18)
    logo.BackgroundTransparency = 1
    logo.ZIndex = 2
    logo.Parent = panel

    local sub = Instance.new("TextLabel")
    sub.Text = "HAMER  //  ENTER KEY"
    sub.Font = Enum.Font.ArialBold
    sub.TextSize = 12
    sub.TextColor3 = Color3.fromRGB(255, 255, 255)
    sub.TextTransparency = 0.45
    sub.Size = UDim2.new(1, 0, 0, 20)
    sub.Position = UDim2.new(0, 0, 0, 122)
    sub.BackgroundTransparency = 1
    sub.ZIndex = 2
    sub.Parent = panel

    local input = Instance.new("TextBox")
    input.Size = UDim2.new(1, -48, 0, 46)
    input.Position = UDim2.new(0, 24, 0, 152)
    input.BackgroundColor3 = Color3.fromRGB(10, 14, 24)
    input.BackgroundTransparency = 0.25
    input.BorderSizePixel = 0
    input.Font = Enum.Font.Arial
    input.TextSize = 15
    input.TextColor3 = Color3.fromRGB(255, 255, 255)
    input.PlaceholderText = "HAMER-XXXX-XXXX"
    input.PlaceholderColor3 = Color3.fromRGB(120, 130, 150)
    input.Text = ""
    input.ClearTextOnFocus = false
    input.Parent = panel

    local ic = Instance.new("UICorner")
    ic.CornerRadius = UDim.new(0, 12)
    ic.Parent = input

    local ist = Instance.new("UIStroke")
    ist.Color = Color3.fromRGB(255, 255, 255)
    ist.Transparency = 0.8
    ist.Parent = input

    local status = Instance.new("TextLabel")
    status.Text = ""
    status.Font = Enum.Font.Arial
    status.TextSize = 13
    status.TextColor3 = Color3.fromRGB(255, 110, 110)
    status.TextXAlignment = Enum.TextXAlignment.Center
    status.Size = UDim2.new(1, 0, 0, 18)
    status.Position = UDim2.new(0, 0, 0, 206)
    status.BackgroundTransparency = 1
    status.Parent = panel

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -48, 0, 46)
    btn.Position = UDim2.new(0, 24, 0, 234)
    btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    btn.BackgroundTransparency = 0.08
    btn.BorderSizePixel = 0
    btn.Text = "ACTIVATE"
    btn.Font = Enum.Font.ArialBold
    btn.TextSize = 15
    btn.TextColor3 = Color3.fromRGB(8, 10, 16)
    btn.AutoButtonColor = false
    btn.Parent = panel

    local bc = Instance.new("UICorner")
    bc.CornerRadius = UDim.new(0, 12)
    bc.Parent = btn

    local guest = Instance.new("TextButton")
    guest.Size = UDim2.new(0, 140, 0, 22)
    guest.Position = UDim2.new(0.5, -70, 1, -30)
    guest.BackgroundTransparency = 1
    guest.Text = "continue as guest"
    guest.Font = Enum.Font.Arial
    guest.TextSize = 12
    guest.TextColor3 = Color3.fromRGB(255, 255, 255)
    guest.TextTransparency = 0.55
    guest.AutoButtonColor = false
    guest.Parent = panel

    local closing = false
    local function grant()
        if closing then return end
        closing = true
        _env.__HAMER_AUTH = true
        TweenService:Create(panel, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0)
        }):Play()
        TweenService:Create(bg, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
        task.delay(0.32, function()
            if gui and gui.Parent then gui:Destroy() end
        end)
    end

    btn.MouseButton1Click:Connect(function()
        local k = input.Text
        local ok = KEYS[k] or (type(k) == "string" and string.sub(k, 1, 6) == "HAMER-")
        if ok then
            status.TextColor3 = Color3.fromRGB(110, 255, 170)
            status.Text = "Access granted. Loading..."
            task.delay(0.25, grant)
        else
            status.TextColor3 = Color3.fromRGB(255, 110, 110)
            status.Text = "Invalid key."
        end
    end)
    guest.MouseButton1Click:Connect(grant)
end

while not _env.__HAMER_AUTH do
    task.wait()
end

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Stats = game:GetService("Stats")

local player = Players.LocalPlayer
local camera = Workspace.CurrentCamera
local ScriptUnloaded = false

local function clamp(v, a, b)
    if v < a then return a end
    if v > b then return b end
    return v
end

local function tween(o, t, props, style, dir)
    local t1 = TweenService:Create(o, TweenInfo.new(t or 0.2, style or Enum.EasingStyle.Quart, dir or Enum.EasingDirection.Out), props)
    t1:Play()
    return t1
end

local SoundFolder = Instance.new("Folder")
SoundFolder.Name = "HamerSounds"
SoundFolder.Parent = SoundService

local SFX = {}
local function makeSound(id, vol, speed)
    local s = Instance.new("Sound")
    s.SoundId = "rbxassetid://" .. id
    s.Volume = vol or 0.4
    s.PlaybackSpeed = speed or 1
    s.Parent = SoundFolder
    return s
end
SFX.Open = makeSound("6895079853", 0.6, 1.4)
SFX.Close = makeSound("6895079853", 0.6, 0.7)
SFX.On = makeSound("6895079853", 0.6, 1.7)
SFX.Off = makeSound("6895079853", 0.6, 0.6)
SFX.Click = makeSound("6895079853", 0.35, 2.0)

local function playSound(s)
    if s then
        pcall(function()
            s:Stop()
            s:Play()
        end)
    end
end

local FONT_BLACK = Enum.Font.ArialBlack
local FONT_REG = Enum.Font.Arial
local FONT_BOLD = Enum.Font.ArialBold

local Themes = {
    Cyan = Color3.fromRGB(0, 229, 255),
    Purple = Color3.fromRGB(186, 120, 255),
    Pink = Color3.fromRGB(255, 120, 200),
    Red = Color3.fromRGB(255, 78, 100),
    Lime = Color3.fromRGB(160, 240, 90),
    Gold = Color3.fromRGB(255, 205, 80),
    Blue = Color3.fromRGB(90, 150, 255),
    Emerald = Color3.fromRGB(70, 235, 155),
    Orange = Color3.fromRGB(255, 150, 70),
    White = Color3.fromRGB(240, 245, 255)
}
local ThemeOrder = {"Cyan", "Purple", "Pink", "Red", "Lime", "Gold", "Blue", "Emerald", "Orange", "White"}

local State = {
    MenuOpen = false,
    CurrentTheme = "Cyan",
    FogEnabled = false, FogDensity = 0.4, FogOffset = 0.25,
    FullbrightEnabled = false, FullbrightBrightness = 3,
    MotionBlurEnabled = false, MotionBlurStrength = 16,
    WorldEnabled = false, WorldSaturation = 0, WorldContrast = 0,
    AspectEnabled = false, AspectValue = 0.8,
    WatermarkEnabled = true,
    ESPEnabled = false, ESPShowName = true, ESPShowDistance = true,
    ESPColor = Color3.fromRGB(0, 229, 255),
    ChinaHatEnabled = false,
    WingsEnabled = false,
    KaguneEnabled = false,
    CompanionEnabled = false,
    HaloEnabled = false,
    DongEnabled = false, DongSize = 1, DongGlow = true, DongColor = Color3.fromRGB(255, 170, 200),
    KorbloxEnabled = false,
    GhostLegsEnabled = false,
    NoAnimsEnabled = false,
    AimBotEnabled = false, AimBotFOV = 160, AimBotSmooth = 0.35, AimBotPart = "Head",
    HitboxEnabled = false, HitboxSize = 8,
    SpeedEnabled = false, SpeedValue = 32,
    JumpEnabled = false, JumpValue = 80,
    InfJumpEnabled = false,
    FlyEnabled = false, FlySpeed = 60,
    NoclipEnabled = false,
    AutoCollectEnabled = false,
    AntiAfkEnabled = false,
    AvatarScale = 1,
    DroneActive = false
}

local function accent()
    return Themes[State.CurrentTheme] or Themes.Cyan
end

local Connections = {}
local function addConnection(c)
    table.insert(Connections, c)
    return c
end

local origLighting = {
    Ambient = Lighting.Ambient,
    OutdoorAmbient = Lighting.OutdoorAmbient,
    Brightness = Lighting.Brightness,
    ClockTime = Lighting.ClockTime,
    GlobalShadows = Lighting.GlobalShadows
}

local themeBindings = {}
local function bindTheme(fn)
    table.insert(themeBindings, fn)
    fn(accent())
end

local function refreshTheme()
    local c = accent()
    for _, fn in ipairs(themeBindings) do
        pcall(fn, c)
    end
end

local function makeGlow(part, color)
    part.Material = Enum.Material.Neon
    part.Color = color
end

local MBEffect = nil
local MB = {amount = 0, lastRot = nil}

local function applyFog()
    local old = Lighting:FindFirstChild("HamerFog")
    if old then old:Destroy() end
    if not State.FogEnabled then return end
    local a = Instance.new("Atmosphere")
    a.Name = "HamerFog"
    a.Density = State.FogDensity
    a.Offset = State.FogOffset
    a.Color = Color3.fromRGB(200, 205, 220)
    a.Decay = Color3.fromRGB(95, 105, 135)
    a.Glare = 0
    a.Haze = 1.5
    a.Parent = Lighting
end

local function applyFullbright()
    if not State.FullbrightEnabled then
        Lighting.Ambient = origLighting.Ambient
        Lighting.OutdoorAmbient = origLighting.OutdoorAmbient
        Lighting.Brightness = origLighting.Brightness
        Lighting.ClockTime = origLighting.ClockTime
        Lighting.GlobalShadows = origLighting.GlobalShadows
        return
    end
    Lighting.Ambient = Color3.fromRGB(255, 255, 255)
    Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
    Lighting.Brightness = State.FullbrightBrightness
    Lighting.ClockTime = 12
    Lighting.GlobalShadows = false
end

local function applyWorld()
    local old = Lighting:FindFirstChild("HamerWorld")
    if old then old:Destroy() end
    if not State.WorldEnabled then return end
    local cc = Instance.new("ColorCorrectionEffect")
    cc.Name = "HamerWorld"
    cc.Saturation = State.WorldSaturation
    cc.Contrast = State.WorldContrast
    cc.Brightness = 0
    cc.TintColor = Color3.fromRGB(255, 255, 255)
    cc.Parent = Lighting
end

local aspectBase, aspectLast = nil, nil
addConnection(RunService.RenderStepped:Connect(function()
    if ScriptUnloaded then return end
    if State.AspectEnabled then
        local cur = camera.CFrame
        if not aspectBase or (aspectLast and (cur.Position - aspectLast.Position).Magnitude > 0.001) then
            aspectBase = cur
        end
        aspectLast = cur
        camera.CFrame = aspectBase * CFrame.new(0, 0, 0, 1, 0, 0, 0, State.AspectValue, 0, 0, 0, 1)
    else
        aspectBase = nil
        aspectLast = nil
    end
end))

addConnection(RunService.RenderStepped:Connect(function(dt)
    if ScriptUnloaded then return end
    if not State.MotionBlurEnabled then
        if MBEffect then MBEffect.Size = 0 end
        MB.lastRot = nil
        MB.amount = 0
        return
    end
    if not MBEffect then
        MBEffect = Instance.new("BlurEffect")
        MBEffect.Name = "HamerMotionBlur"
        MBEffect.Size = 0
        MBEffect.Parent = Lighting
    end
    local cur = camera.CFrame.LookVector
    local speed = 0
    if MB.lastRot then
        local dot = cur:Dot(MB.lastRot)
        local angle = math.acos(clamp(dot, -1, 1))
        speed = angle / math.max(dt, 0.001)
    end
    MB.lastRot = cur
    local target = clamp(speed * 2, 0, State.MotionBlurStrength)
    MB.amount = MB.amount + (target - MB.amount) * math.min(dt * 10, 1)
    MBEffect.Size = MB.amount
end))

local function getHip(char)
    return char:FindFirstChild("LowerTorso") or char:FindFirstChild("Torso") or char:FindFirstChild("HumanoidRootPart")
end
local Wings = {model = nil, conn = nil, t = 0, blend = 0}
local function applyWings()
    if Wings.conn then Wings.conn:Disconnect(); Wings.conn = nil end
    if Wings.model then Wings.model:Destroy(); Wings.model = nil end
    if not State.WingsEnabled then return end
    local char = player.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    local color = accent()
    local model = Instance.new("Model")
    model.Name = "HamerWings"
    model.Parent = Workspace
    Wings.model = model
    local parts = {}
    for _, L in ipairs({{count = 10, l = 1.0, h = 1.3, b = 0.9, s = 1.4}, {count = 8, l = 0.85, h = 1.2, b = 1.05, s = 1.7}}) do
        for sign = -1, 1, 2 do
            for i = 1, L.count do
                local t = (i - 1) / (L.count - 1)
                local len = (3.0 * (1 - t * 0.3)) * L.l
                local p = Instance.new("Part")
                p.Size = Vector3.new(len, 0.9 * L.h, 0.16)
                p.Anchored = true
                p.CanCollide = false
                p.CanQuery = false
                p.CanTouch = false
                p.CastShadow = false
                p.Massless = true
                makeGlow(p, color)
                p.Parent = model
                p:SetAttribute("sx", (1.4 + t * 2.6) * L.s * sign)
                p:SetAttribute("sy", math.sin(t * math.pi * 0.6) * 1.5)
                p:SetAttribute("sz", (0.8 + t * 0.4) * L.b)
                p:SetAttribute("ang", math.rad(12 + t * 40) * sign)
                p:SetAttribute("i", i)
                table.insert(parts, p)
            end
        end
    end
    Wings.t = 0
    Wings.blend = 0
    Wings.conn = RunService.RenderStepped:Connect(function(dt)
        if not State.WingsEnabled or not model.Parent then return end
        local c = player.Character
        if not c then return end
        local r = c:FindFirstChild("HumanoidRootPart")
        if not r then return end
        local hum = c:FindFirstChildOfClass("Humanoid")
        Wings.t = Wings.t + dt
        local walking = hum and hum.MoveDirection.Magnitude > 0.1
        local target = walking and 1 or 0
        Wings.blend = Wings.blend + (target - Wings.blend) * math.min(dt * 4, 1)
        local idle = math.sin(Wings.t * 2.5) * 0.12
        local walk = math.sin(Wings.t * 6) * 0.15
        for _, p in ipairs(parts) do
            if p.Parent then
                local fi = p:GetAttribute("i")
                local wd = math.sin(Wings.t * 6 - fi * 0.3) * 0.12
                local fo = idle * (1 - Wings.blend) + (walk + wd) * Wings.blend
                local off = Vector3.new(p:GetAttribute("sx"), p:GetAttribute("sy") + fo, p:GetAttribute("sz"))
                p.CFrame = r.CFrame * CFrame.new(off) * CFrame.Angles(0, 0, p:GetAttribute("ang") + fo * 0.3) * CFrame.Angles(math.rad(fo * 30), 0, 0)
            end
        end
    end)
end

local CH = {model = nil, conn = nil}
local function applyChinaHat()
    if CH.conn then CH.conn:Disconnect(); CH.conn = nil end
    if CH.model then CH.model:Destroy(); CH.model = nil end
    if not State.ChinaHatEnabled then return end
    local char = player.Character
    if not char or not char:FindFirstChild("Head") then return end
    local color = accent()
    local model = Instance.new("Model")
    model.Name = "HamerChinaHat"
    model.Parent = Workspace
    CH.model = model
    local parts = {}
    local brim = Instance.new("Part")
    brim.Shape = Enum.PartType.Cylinder
    brim.Size = Vector3.new(0.1, 3.2, 3.2)
    brim.Anchored = true
    brim.CanCollide = false
    brim.CanQuery = false
    brim.CanTouch = false
    brim.CastShadow = false
    brim.Massless = true
    makeGlow(brim, color)
    brim.Parent = model
    table.insert(parts, {p = brim, y = 0.6})
    for i = 1, 22 do
        local t = i / 22
        local d = 2.9 * (1 - t) + 0.06 * t
        local p = Instance.new("Part")
        p.Shape = Enum.PartType.Cylinder
        p.Size = Vector3.new(0.08, d, d)
        p.Anchored = true
        p.CanCollide = false
        p.CanQuery = false
        p.CanTouch = false
        p.CastShadow = false
        p.Massless = true
        makeGlow(p, color)
        p.Parent = model
        table.insert(parts, {p = p, y = 0.2 + t * 1.3})
    end
    CH.conn = RunService.RenderStepped:Connect(function()
        if not State.ChinaHatEnabled or not model.Parent then return end
        local c = player.Character
        if not c then return end
        local h = c:FindFirstChild("Head")
        if not h then return end
        for _, e in ipairs(parts) do
            if e.p and e.p.Parent then
                e.p.CFrame = h.CFrame * CFrame.new(0, e.y, 0) * CFrame.Angles(0, 0, math.rad(90))
            end
        end
    end)
end

local KG = {model = nil, conn = nil, t = 0, blend = 0}
local function applyKagune()
    if KG.conn then KG.conn:Disconnect(); KG.conn = nil end
    if KG.model then KG.model:Destroy(); KG.model = nil end
    if not State.KaguneEnabled then return end
    local char = player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local color = Color3.fromRGB(220, 30, 40)
    local model = Instance.new("Model")
    model.Name = "HamerKagune"
    model.Parent = Workspace
    KG.model = model
    local parts = {}
    for sx = -1, 1, 2 do
        for sy = -1, 1, 2 do
            for i = 1, 16 do
                local t = (i - 1) / 15
                local p = Instance.new("Part")
                p.Shape = Enum.PartType.Block
                p.Size = Vector3.new(0.5, 0.5, 0.5)
                p.Anchored = true
                p.CanCollide = false
                p.CanQuery = false
                p.CanTouch = false
                p.CastShadow = false
                p.Massless = true
                makeGlow(p, color)
                p.Parent = model
                p:SetAttribute("x", (0.5 + t * 2.0) * sx)
                p:SetAttribute("y", (0.3 + t * 1.6) * sy)
                p:SetAttribute("z", 0.5 - math.max(0, (t - 0.5) / 0.5) * 1.5)
                p:SetAttribute("t", t)
                p:SetAttribute("si", i)
                p:SetAttribute("us", sy)
                table.insert(parts, p)
            end
        end
    end
    KG.t = 0
    KG.blend = 0
    KG.conn = RunService.RenderStepped:Connect(function(dt)
        if not State.KaguneEnabled or not model.Parent then return end
        local c = player.Character
        if not c then return end
        local r = c:FindFirstChild("HumanoidRootPart")
        if not r then return end
        local hum = c:FindFirstChildOfClass("Humanoid")
        KG.t = KG.t + dt
        local walking = hum and hum.MoveDirection.Magnitude > 0.1
        KG.blend = KG.blend + ((walking and 1 or 0) - KG.blend) * math.min(dt * 4, 1)
        local idle = math.sin(KG.t * 2.0) * 0.15
        local walk = math.sin(KG.t * 5) * 0.2
        for _, p in ipairs(parts) do
            if p.Parent then
                local t = p:GetAttribute("t")
                local us = p:GetAttribute("us")
                local wd = math.sin(KG.t * 5 - p:GetAttribute("si") * 0.3) * 0.15
                local fo = idle * (1 - KG.blend) + (walk + wd) * KG.blend
                local off = Vector3.new(p:GetAttribute("x") + fo * 0.5 * t, p:GetAttribute("y") + fo * us * t, p:GetAttribute("z"))
                p.CFrame = r.CFrame * CFrame.new(off) * CFrame.Angles(0, 0, math.rad(us * 45) + fo * us * 0.25) * CFrame.Angles(t * 1.2, 0, 0)
            end
        end
    end)
end
local CMP = {model = nil, conn = nil, t = 0}
local function applyCompanion()
    if CMP.conn then CMP.conn:Disconnect(); CMP.conn = nil end
    if CMP.model then CMP.model:Destroy(); CMP.model = nil end
    if not State.CompanionEnabled then return end
    local char = player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local color = accent()
    local model = Instance.new("Model")
    model.Name = "HamerCompanion"
    model.Parent = Workspace
    CMP.model = model
    local box = Instance.new("Part")
    box.Shape = Enum.PartType.Block
    box.Size = Vector3.new(0.7, 0.7, 0.7)
    box.Anchored = true
    box.CanCollide = false
    box.CanQuery = false
    box.CanTouch = false
    box.CastShadow = false
    box.Massless = true
    makeGlow(box, color)
    box.Parent = model
    local core = Instance.new("Part")
    core.Shape = Enum.PartType.Ball
    core.Size = Vector3.new(0.28, 0.28, 0.28)
    core.Anchored = true
    core.CanCollide = false
    core.CanQuery = false
    core.CanTouch = false
    core.CastShadow = false
    core.Material = Enum.Material.Neon
    core.Color = Color3.fromRGB(255, 255, 255)
    core.Transparency = 0.15
    core.Parent = model
    CMP.t = 0
    CMP.conn = RunService.RenderStepped:Connect(function(dt)
        if not State.CompanionEnabled or not model.Parent then return end
        local c = player.Character
        if not c then return end
        local r = c:FindFirstChild("HumanoidRootPart")
        if not r then return end
        CMP.t = CMP.t + dt
        local t = CMP.t
        local bob = math.sin(t * 2.5) * 0.15
        local sway = math.sin(t * 1.8) * 0.2
        local target = r.Position + r.CFrame.LookVector * (2.5 + sway) + r.CFrame.RightVector * 2.0 + r.CFrame.UpVector * (1.2 + bob)
        local pos = box.Position:Lerp(target, math.min(dt * 8, 1))
        box.CFrame = CFrame.new(pos) * CFrame.Angles(math.sin(t * 2) * 0.3, t * 3, math.sin(t * 2) * 0.15)
        local cs = 0.28 + math.sin(t * 4) * 0.05
        core.Size = Vector3.new(cs, cs, cs)
        core.CFrame = box.CFrame
        core.Transparency = 0.15 + math.sin(t * 4) * 0.08
    end)
end

local Halo = {model = nil, conn = nil, t = 0}
local function applyHalo()
    if Halo.conn then Halo.conn:Disconnect(); Halo.conn = nil end
    if Halo.model then Halo.model:Destroy(); Halo.model = nil end
    if not State.HaloEnabled then return end
    local char = player.Character
    if not char or not char:FindFirstChild("Head") then return end
    local color = accent()
    local model = Instance.new("Model")
    model.Name = "HamerHalo"
    model.Parent = Workspace
    Halo.model = model
    local parts = {}
    for i = 1, 24 do
        local p = Instance.new("Part")
        p.Shape = Enum.PartType.Ball
        p.Size = Vector3.new(0.18, 0.18, 0.18)
        p.Anchored = true
        p.CanCollide = false
        p.CanQuery = false
        p.CanTouch = false
        p.CastShadow = false
        p.Massless = true
        makeGlow(p, color)
        p.Parent = model
        table.insert(parts, {p = p, a = (i - 1) / 24 * math.pi * 2})
    end
    Halo.t = 0
    Halo.conn = RunService.RenderStepped:Connect(function(dt)
        if not State.HaloEnabled or not model.Parent then return end
        local c = player.Character
        if not c then return end
        local h = c:FindFirstChild("Head")
        if not h then return end
        Halo.t = Halo.t + dt
        for _, e in ipairs(parts) do
            local a = e.a + Halo.t * 1.5
            e.p.CFrame = h.CFrame * CFrame.new(math.cos(a) * 1.0, 1.15, math.sin(a) * 1.0)
        end
    end)
end

local Dong = {model = nil, conn = nil, t = 0}
local function applyDong()
    if Dong.conn then Dong.conn:Disconnect(); Dong.conn = nil end
    if Dong.model then Dong.model:Destroy(); Dong.model = nil end
    if not State.DongEnabled then return end
    local char = player.Character
    if not char then return end
    local base = getHip(char)
    if not base then return end
    local model = Instance.new("Model")
    model.Name = "HamerDong"
    model.Parent = Workspace
    Dong.model = model
    local s = State.DongSize
    local function mk(shape, size)
        local p = Instance.new("Part")
        p.Shape = shape
        p.Size = size
        p.Anchored = true
        p.CanCollide = false
        p.CanQuery = false
        p.CanTouch = false
        p.CastShadow = false
        p.Massless = true
        if State.DongGlow then
            p.Material = Enum.Material.Neon
        else
            p.Material = Enum.Material.SmoothPlastic
        end
        p.Color = State.DongColor
        p.Parent = model
        return p
    end
    local ballL = mk(Enum.PartType.Ball, Vector3.new(0.56 * s, 0.56 * s, 0.56 * s))
    local ballR = mk(Enum.PartType.Ball, Vector3.new(0.56 * s, 0.56 * s, 0.56 * s))
    local len = 1.25 * s
    local shaft = mk(Enum.PartType.Cylinder, Vector3.new(len, 0.5 * s, 0.5 * s))
    local head = mk(Enum.PartType.Ball, Vector3.new(0.62 * s, 0.62 * s, 0.62 * s))
    Dong.t = 0
    Dong.conn = RunService.RenderStepped:Connect(function(dt)
        if not State.DongEnabled or not model.Parent then return end
        local c = player.Character
        if not c then return end
        local b = getHip(c)
        if not b then return end
        Dong.t = Dong.t + dt
        local sway = math.sin(Dong.t * 2.2) * 0.09
        local bob = math.sin(Dong.t * 3.0) * 0.04
        local cf = b.CFrame
        local off = CFrame.new(0, -0.55 * s + bob, -0.5 * s)
        ballL.CFrame = cf * off * CFrame.new(-0.28 * s, 0, 0)
        ballR.CFrame = cf * off * CFrame.new(0.28 * s, 0, 0)
        shaft.CFrame = cf * off * CFrame.new(0, 0, -len / 2) * CFrame.Angles(0, math.rad(90), 0) * CFrame.Angles(0, 0, sway)
        head.CFrame = cf * off * CFrame.new(0, 0, -len) * CFrame.Angles(0, 0, sway)
    end)
end

local function applyKorblox(enable)
    State.KorbloxEnabled = enable
    local char = player.Character
    if not char then return end
    for _, n in ipairs({"Right Leg", "RightUpperLeg", "RightLowerLeg"}) do
        local p = char:FindFirstChild(n)
        if p then
            p.Transparency = enable and 1 or 0
            p.CanCollide = not enable
        end
    end
end

local function applyGhostLegs(enable)
    State.GhostLegsEnabled = enable
    local char = player.Character
    if not char then return end
    for _, n in ipairs({"Left Leg", "Right Leg", "LeftUpperLeg", "RightUpperLeg", "LeftLowerLeg", "RightLowerLeg"}) do
        local p = char:FindFirstChild(n)
        if p then
            p.Transparency = enable and 1 or 0
            p.CanCollide = not enable
        end
    end
end

local function applyNoAnims(enable)
    State.NoAnimsEnabled = enable
    local char = player.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    local animator = hum:FindFirstChildOfClass("Animator")
    if not animator then return end
    if enable then
        for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
            pcall(function() track:Stop() end)
        end
    end
end
local ESP = {boxes = {}}
local espGui = Instance.new("ScreenGui")
espGui.Name = "HamerESP"
espGui.ResetOnSpawn = false
espGui.IgnoreGuiInset = true
espGui.DisplayOrder = 500
espGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
espGui.Parent = player:WaitForChild("PlayerGui")

local function projectPoint(worldPos)
    local vp = camera.ViewportSize
    if vp.X == 0 or vp.Y == 0 then return nil, false end
    local rel = camera.CFrame:PointToObjectSpace(worldPos)
    if rel.Z >= 0 then return nil, false end
    local fovRad = math.rad(camera.FieldOfView)
    local tanHalf = math.tan(fovRad * 0.5)
    local aspect = vp.X / vp.Y
    local ndcX = (rel.X / -rel.Z) / (tanHalf * aspect)
    local ndcY = (rel.Y / -rel.Z) / tanHalf
    return Vector2.new((ndcX * 0.5 + 0.5) * vp.X, (1 - (ndcY * 0.5 + 0.5)) * vp.Y), true
end

local function createESPBox(target)
    if not target or target == player then return end
    if ESP.boxes[target] then return end
    local box = {}
    box.frame = Instance.new("Frame")
    box.frame.Name = "HamerESP_" .. target.Name
    box.frame.BackgroundTransparency = 1
    box.frame.BorderSizePixel = 0
    box.frame.Visible = false
    box.frame.ZIndex = 500
    box.frame.Parent = espGui
    local stripes = {}
    local function stripe(size, pos)
        local s = Instance.new("Frame")
        s.BackgroundColor3 = State.ESPColor
        s.BorderSizePixel = 0
        s.Size = size
        s.Position = pos
        s.ZIndex = 501
        s.Parent = box.frame
        table.insert(stripes, s)
    end
    stripe(UDim2.new(1, 0, 0, 2), UDim2.new(0, 0, 0, 0))
    stripe(UDim2.new(1, 0, 0, 2), UDim2.new(0, 0, 1, -2))
    stripe(UDim2.new(0, 2, 1, 0), UDim2.new(0, 0, 0, 0))
    stripe(UDim2.new(0, 2, 1, 0), UDim2.new(1, -2, 0, 0))
    box.stripes = stripes
    box.nameLabel = Instance.new("TextLabel")
    box.nameLabel.BackgroundColor3 = Color3.fromRGB(10, 12, 18)
    box.nameLabel.BackgroundTransparency = 0.2
    box.nameLabel.Text = target.Name
    box.nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    box.nameLabel.Font = FONT_BOLD
    box.nameLabel.TextSize = 14
    box.nameLabel.TextStrokeTransparency = 0.4
    box.nameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    box.nameLabel.Size = UDim2.new(0, 150, 0, 22)
    box.nameLabel.Position = UDim2.new(0.5, -75, 0, -28)
    box.nameLabel.Visible = State.ESPShowName
    box.nameLabel.ZIndex = 502
    box.nameLabel.Parent = box.frame
    local nc = Instance.new("UICorner")
    nc.CornerRadius = UDim.new(0, 6)
    nc.Parent = box.nameLabel
    box.distLabel = Instance.new("TextLabel")
    box.distLabel.BackgroundColor3 = Color3.fromRGB(10, 12, 18)
    box.distLabel.BackgroundTransparency = 0.3
    box.distLabel.Text = ""
    box.distLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    box.distLabel.Font = FONT_BOLD
    box.distLabel.TextSize = 12
    box.distLabel.Size = UDim2.new(0, 90, 0, 18)
    box.distLabel.Position = UDim2.new(0.5, -45, 1, 6)
    box.distLabel.Visible = State.ESPShowDistance
    box.distLabel.ZIndex = 502
    box.distLabel.Parent = box.frame
    local dc = Instance.new("UICorner")
    dc.CornerRadius = UDim.new(0, 6)
    dc.Parent = box.distLabel
    ESP.boxes[target] = box
end

local function updateESPBoxes()
    if ScriptUnloaded or not State.ESPEnabled then return end
    for target, box in pairs(ESP.boxes) do
        local char = target.Character
        if char then
            local root = char:FindFirstChild("HumanoidRootPart")
            local hum = char:FindFirstChildOfClass("Humanoid")
            if root and hum and hum.Health > 0 then
                local minV = Vector3.new(math.huge, math.huge, math.huge)
                local maxV = Vector3.new(-math.huge, -math.huge, -math.huge)
                for _, name in ipairs({"HumanoidRootPart", "Head", "UpperTorso", "LowerTorso", "Torso"}) do
                    local p = char:FindFirstChild(name)
                    if p and p:IsA("BasePart") then
                        local sz, pos = p.Size, p.Position
                        minV = Vector3.new(math.min(minV.X, pos.X - sz.X / 2), math.min(minV.Y, pos.Y - sz.Y / 2), math.min(minV.Z, pos.Z - sz.Z / 2))
                        maxV = Vector3.new(math.max(maxV.X, pos.X + sz.X / 2), math.max(maxV.Y, pos.Y + sz.Y / 2), math.max(maxV.Z, pos.Z + sz.Z / 2))
                    end
                end
                if minV.X == math.huge then
                    minV = root.Position - root.Size / 2
                    maxV = root.Position + root.Size / 2
                end
                local corners = {}
                local allOn = true
                for xi = 0, 1 do
                    for yi = 0, 1 do
                        for zi = 0, 1 do
                            local v = Vector3.new(xi == 0 and minV.X or maxV.X, yi == 0 and minV.Y or maxV.Y, zi == 0 and minV.Z or maxV.Z)
                            local sp, on = projectPoint(v)
                            if not on or not sp then
                                allOn = false
                                break
                            end
                            table.insert(corners, sp)
                        end
                        if not allOn then break end
                    end
                    if not allOn then break end
                end
                if allOn and #corners == 8 then
                    local minX, minY, maxX, maxY = math.huge, math.huge, -math.huge, -math.huge
                    for _, sp in ipairs(corners) do
                        minX = math.min(minX, sp.X)
                        maxX = math.max(maxX, sp.X)
                        minY = math.min(minY, sp.Y)
                        maxY = math.max(maxY, sp.Y)
                    end
                    box.frame.Visible = true
                    box.frame.Position = UDim2.new(0, minX, 0, minY)
                    box.frame.Size = UDim2.new(0, maxX - minX, 0, maxY - minY)
                    if State.ESPShowDistance and player.Character then
                        local myRoot = player.Character:FindFirstChild("HumanoidRootPart")
                        if myRoot then
                            box.distLabel.Text = math.floor((myRoot.Position - root.Position).Magnitude) .. "m"
                        end
                    end
                else
                    box.frame.Visible = false
                end
            else
                box.frame.Visible = false
            end
        else
            box.frame.Visible = false
        end
    end
end

local function cleanupBox(target)
    local box = ESP.boxes[target]
    if not box then return end
    if box.frame then box.frame:Destroy() end
    ESP.boxes[target] = nil
end

local function destroyAllESP()
    for target, _ in pairs(ESP.boxes) do
        cleanupBox(target)
    end
    ESP.boxes = {}
end

local function applyESP()
    if not State.ESPEnabled then
        destroyAllESP()
        return
    end
    for _, p in ipairs(Players:GetPlayers()) do
        createESPBox(p)
    end
end

local function updateESPColors()
    for _, box in pairs(ESP.boxes) do
        if box.stripes then
            for _, s in ipairs(box.stripes) do
                s.BackgroundColor3 = State.ESPColor
            end
        end
        if box.nameLabel then box.nameLabel.Visible = State.ESPShowName end
        if box.distLabel then box.distLabel.Visible = State.ESPShowDistance end
    end
end

addConnection(Players.PlayerAdded:Connect(function(p)
    if State.ESPEnabled then createESPBox(p) end
end))
addConnection(Players.PlayerRemoving:Connect(cleanupBox))
addConnection(RunService.RenderStepped:Connect(updateESPBoxes))
local flyBV, flyBG = nil, nil
local noclipOriginals = {}
local hitboxOriginals = {}
local autoCollectAcc = 0

local function updateFly()
    local char = player.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not root or not hum then return end
    if State.FlyEnabled then
        if not flyBV then
            flyBV = Instance.new("BodyVelocity")
            flyBV.MaxForce = Vector3.new(1e5, 1e5, 1e5)
            flyBV.Velocity = Vector3.zero
            flyBV.Parent = root
        end
        if not flyBG then
            flyBG = Instance.new("BodyGyro")
            flyBG.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
            flyBG.P = 1200
            flyBG.D = 50
            flyBG.Parent = root
        end
        hum.PlatformStand = true
        local move = Vector3.zero
        local cf = camera.CFrame
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then move = move + cf.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then move = move - cf.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then move = move - cf.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then move = move + cf.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0, 1, 0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then move = move - Vector3.new(0, 1, 0) end
        if move.Magnitude > 0 then
            move = move.Unit * State.FlySpeed
        end
        flyBV.Velocity = move
        flyBG.CFrame = cf
    else
        if flyBV then flyBV:Destroy(); flyBV = nil end
        if flyBG then flyBG:Destroy(); flyBG = nil end
        hum.PlatformStand = false
    end
end

local function updateNoclip()
    local char = player.Character
    if not char then return end
    if State.NoclipEnabled then
        for _, p in ipairs(char:GetDescendants()) do
            if p:IsA("BasePart") and noclipOriginals[p] == nil then
                noclipOriginals[p] = p.CanCollide
                p.CanCollide = false
            end
        end
    else
        for p, v in pairs(noclipOriginals) do
            if p and p.Parent then p.CanCollide = v end
        end
        noclipOriginals = {}
    end
end

local function updateHitbox()
    if not State.HitboxEnabled then
        if next(hitboxOriginals) == nil then return end
        for p, v in pairs(hitboxOriginals) do
            if p and p.Parent then p.Size = v end
        end
        hitboxOriginals = {}
        return
    end
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= player and p.Character then
            local root = p.Character:FindFirstChild("HumanoidRootPart")
            if root then
                if hitboxOriginals[root] == nil then hitboxOriginals[root] = root.Size end
                root.Size = Vector3.new(State.HitboxSize, State.HitboxSize, State.HitboxSize)
                root.CanCollide = false
            end
        end
    end
end

local function updateAutoCollect(dt)
    if not State.AutoCollectEnabled then return end
    autoCollectAcc = autoCollectAcc + dt
    if autoCollectAcc < 0.25 then return end
    autoCollectAcc = 0
    local char = player.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    local names = {"Coin", "Cash", "Money", "Gem", "Orb", "Diamond", "CoinBag"}
    for _, d in ipairs(Workspace:GetDescendants()) do
        if d:IsA("BasePart") then
            for _, n in ipairs(names) do
                if string.find(string.lower(d.Name), string.lower(n)) then
                    if (d.Position - root.Position).Magnitude < 90 then
                        root.CFrame = CFrame.new(d.Position + Vector3.new(0, 3, 0))
                    end
                    break
                end
            end
        end
    end
end

addConnection(RunService.Heartbeat:Connect(function(dt)
    if ScriptUnloaded then return end
    local char = player.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            if State.SpeedEnabled then hum.WalkSpeed = State.SpeedValue else hum.WalkSpeed = 16 end
            if State.JumpEnabled then
                hum.UseJumpPower = true
                hum.JumpPower = State.JumpValue
            end
        end
    end
    updateFly()
    updateNoclip()
    updateHitbox()
    updateAutoCollect(dt)
end))

addConnection(UserInputService.JumpRequest:Connect(function()
    if not State.InfJumpEnabled then return end
    local char = player.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then
        hum:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end))

addConnection(RunService.RenderStepped:Connect(function()
    if ScriptUnloaded or not State.AimBotEnabled then return end
    local vp = camera.ViewportSize
    local center = Vector2.new(vp.X / 2, vp.Y / 2)
    local best, bestDist = nil, math.huge
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= player and p.Character then
            local hum = p.Character:FindFirstChildOfClass("Humanoid")
            local part = p.Character:FindFirstChild(State.AimBotPart) or p.Character:FindFirstChild("HumanoidRootPart")
            if hum and hum.Health > 0 and part then
                local sp, on = camera:WorldToViewportPoint(part.Position)
                if on then
                    local d = (Vector2.new(sp.X, sp.Y) - center).Magnitude
                    if d <= State.AimBotFOV and d < bestDist then
                        bestDist = d
                        best = part
                    end
                end
            end
        end
    end
    if best then
        local goal = CFrame.new(camera.CFrame.Position, best.Position)
        camera.CFrame = camera.CFrame:Lerp(goal, clamp(1 - State.AimBotSmooth, 0.05, 1))
    end
end))

local Drone = {model = nil, conn = nil, active = false, t = 0}

local function createDroneModel()
    local model = Instance.new("Model")
    model.Name = "HamerDrone"
    local body = Instance.new("Part")
    body.Name = "Fuselage"
    body.Shape = Enum.PartType.Block
    body.Size = Vector3.new(0.9, 0.7, 3.2)
    body.CFrame = CFrame.new(0, 0, 0)
    body.Anchored = true
    body.CanCollide = false
    body.CanQuery = false
    body.CanTouch = false
    body.CastShadow = false
    body.Material = Enum.Material.Metal
    body.Color = Color3.fromRGB(205, 210, 220)
    body.Parent = model
    local wingL = Instance.new("Part")
    wingL.Name = "WingL"
    wingL.Size = Vector3.new(3.2, 0.1, 1.1)
    wingL.CFrame = CFrame.new(-1.4, 0, 0.4)
    wingL.Anchored = true
    wingL.CanCollide = false
    wingL.CanQuery = false
    wingL.CanTouch = false
    wingL.CastShadow = false
    wingL.Material = Enum.Material.Metal
    wingL.Color = Color3.fromRGB(190, 195, 205)
    wingL.Parent = model
    local wingR = wingL:Clone()
    wingR.Name = "WingR"
    wingR.CFrame = CFrame.new(1.4, 0, 0.4)
    wingR.Parent = model
    local prop = Instance.new("Part")
    prop.Name = "Propeller"
    prop.Shape = Enum.PartType.Block
    prop.Size = Vector3.new(0.12, 1.5, 0.12)
    prop.CFrame = CFrame.new(0, 0, 1.9)
    prop.Anchored = true
    prop.CanCollide = false
    prop.CanQuery = false
    prop.CanTouch = false
    prop.CastShadow = false
    prop.Material = Enum.Material.Wood
    prop.Color = Color3.fromRGB(190, 150, 100)
    prop.Parent = model
    local nose = Instance.new("Part")
    nose.Name = "Nose"
    nose.Shape = Enum.PartType.Ball
    nose.Size = Vector3.new(0.6, 0.6, 0.9)
    nose.CFrame = CFrame.new(0, 0, -1.7)
    nose.Anchored = true
    nose.CanCollide = false
    nose.CanQuery = false
    nose.CanTouch = false
    nose.CastShadow = false
    nose.Material = Enum.Material.Metal
    nose.Color = Color3.fromRGB(60, 65, 75)
    nose.Parent = model
    model.PrimaryPart = body
    return model, prop
end

local function stopDrone()
    Drone.active = false
    State.DroneActive = false
    if Drone.conn then Drone.conn:Disconnect(); Drone.conn = nil end
    if Drone.model and Drone.model.Parent then Drone.model:Destroy() end
    Drone.model = nil
end

local function startDrone()
    if Drone.active then return end
    local char = player.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    local model, prop = createDroneModel()
    model:PivotTo(CFrame.new(root.Position + root.CFrame.LookVector * 4 + Vector3.new(0, 4, 0)))
    model.Parent = Workspace
    Drone.model = model
    Drone.active = true
    State.DroneActive = true
    Drone.t = 0
    local target = nil
    local bestDist = math.huge
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= player and p.Character then
            local r = p.Character:FindFirstChild("HumanoidRootPart")
            if r then
                local d = (r.Position - root.Position).Magnitude
                if d < bestDist then
                    bestDist = d
                    target = p
                end
            end
        end
    end
    Drone.conn = RunService.Heartbeat:Connect(function(dt)
        if not Drone.active or not model.Parent then return end
        Drone.t = Drone.t + dt
        local fus = model:FindFirstChild("Fuselage")
        if not fus then return end
        local targetPos
        if target and target.Character then
            local tr = target.Character:FindFirstChild("HumanoidRootPart")
            if tr then targetPos = tr.Position end
        end
        if not targetPos then
            targetPos = fus.Position + fus.CFrame.LookVector * 10
        end
        local dir = targetPos - fus.Position
        if dir.Magnitude > 0.1 then
            local nextPos = fus.Position + dir.Unit * 45 * dt
            model:PivotTo(CFrame.lookAt(nextPos, targetPos))
        end
        if prop and prop.Parent then
            prop.CFrame = fus.CFrame * CFrame.new(0, 0, 1.9) * CFrame.Angles(0, 0, Drone.t * 35)
        end
        if target and target.Character then
            local tr = target.Character:FindFirstChild("HumanoidRootPart")
            if tr and (tr.Position - fus.Position).Magnitude < 3 then
                local hum = target.Character:FindFirstChildOfClass("Humanoid")
                if hum then hum.Health = 0 end
                stopDrone()
            end
        end
        if Drone.t > 30 then stopDrone() end
    end)
end
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "HamerUI"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.DisplayOrder = 999
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = player:WaitForChild("PlayerGui")

local blur = Instance.new("BlurEffect")
blur.Name = "HamerBlur"
blur.Size = 0
blur.Parent = Lighting

local dim = Instance.new("Frame")
dim.Size = UDim2.new(1, 0, 1, 0)
dim.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
dim.BackgroundTransparency = 1
dim.BorderSizePixel = 0
dim.Visible = false
dim.ZIndex = 5
dim.Parent = screenGui

local function glassify(f, radius, light)
    f.BorderSizePixel = 0
    f.BackgroundColor3 = Color3.fromRGB(18, 22, 34)
    f.BackgroundTransparency = light and 0.55 or 0.35
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius or 16)
    c.Parent = f
    local s = Instance.new("UIStroke")
    s.Color = Color3.fromRGB(255, 255, 255)
    s.Transparency = 0.78
    s.Thickness = 1
    s.Parent = f
    local g = Instance.new("UIGradient")
    g.Rotation = 125
    g.Color = ColorSequence.new(Color3.fromRGB(52, 60, 88), Color3.fromRGB(8, 10, 18))
    g.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, light and 0.35 or 0.18),
        NumberSequenceKeypoint.new(0.5, light and 0.55 or 0.4),
        NumberSequenceKeypoint.new(1, light and 0.75 or 0.62)
    })
    g.Parent = f
    return s, g
end

local UI = {}
UI.main = Instance.new("Frame")
UI.main.Name = "Main"
UI.main.Size = UDim2.new(0, 760, 0, 500)
UI.main.Position = UDim2.new(0.5, -380, 0.5, -250)
UI.main.Visible = false
UI.main.ClipsDescendants = true
UI.main.ZIndex = 10
UI.main.Parent = screenGui
glassify(UI.main, 22, false)

local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 58)
header.BackgroundTransparency = 1
header.ZIndex = 11
header.Parent = UI.main

local hline = Instance.new("Frame")
hline.Size = UDim2.new(1, 0, 0, 1)
hline.Position = UDim2.new(0, 0, 1, -1)
hline.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
hline.BackgroundTransparency = 0.88
hline.BorderSizePixel = 0
hline.ZIndex = 11
hline.Parent = header

local logo = Instance.new("TextLabel")
logo.Text = "H"
logo.Font = FONT_BLACK
logo.TextSize = 34
logo.TextColor3 = Color3.fromRGB(255, 255, 255)
logo.Size = UDim2.new(0, 44, 0, 44)
logo.Position = UDim2.new(0, 26, 0, 7)
logo.BackgroundTransparency = 1
logo.ZIndex = 12
logo.Parent = header

local title = Instance.new("TextLabel")
title.Text = "HAMER"
title.Font = FONT_BLACK
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextXAlignment = Enum.TextXAlignment.Left
title.Size = UDim2.new(0, 150, 0, 30)
title.Position = UDim2.new(0, 74, 0, 14)
title.BackgroundTransparency = 1
title.ZIndex = 12
title.Parent = header

local subtitle = Instance.new("TextLabel")
subtitle.Text = "CLIENT  //  VISUAL"
subtitle.Font = FONT_BOLD
subtitle.TextSize = 12
subtitle.TextColor3 = Color3.fromRGB(255, 255, 255)
subtitle.TextTransparency = 0.5
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.Size = UDim2.new(0, 200, 0, 20)
subtitle.Position = UDim2.new(0, 200, 0, 20)
subtitle.BackgroundTransparency = 1
subtitle.ZIndex = 12
subtitle.Parent = header

local verLbl = Instance.new("TextLabel")
verLbl.Text = "v1.0"
verLbl.Font = FONT_BOLD
verLbl.TextSize = 12
verLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
verLbl.TextTransparency = 0.55
verLbl.TextXAlignment = Enum.TextXAlignment.Right
verLbl.Size = UDim2.new(0, 60, 0, 20)
verLbl.Position = UDim2.new(1, -150, 0, 20)
verLbl.BackgroundTransparency = 1
verLbl.ZIndex = 12
verLbl.Parent = header

local closeBtn = Instance.new("TextButton")
closeBtn.Text = "×"
closeBtn.Font = FONT_REG
closeBtn.TextSize = 26
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextTransparency = 0.35
closeBtn.Size = UDim2.new(0, 34, 0, 34)
closeBtn.Position = UDim2.new(1, -46, 0, 12)
closeBtn.BackgroundTransparency = 1
closeBtn.AutoButtonColor = false
closeBtn.ZIndex = 13
closeBtn.Parent = header

local keyHint = Instance.new("TextLabel")
keyHint.Text = "RSHIFT"
keyHint.Font = FONT_BOLD
keyHint.TextSize = 10
keyHint.TextColor3 = Color3.fromRGB(255, 255, 255)
keyHint.TextTransparency = 0.6
keyHint.TextXAlignment = Enum.TextXAlignment.Right
keyHint.Size = UDim2.new(1, -16, 1, -8)
keyHint.Position = UDim2.new(0, 0, 1, -26)
keyHint.BackgroundTransparency = 1
keyHint.ZIndex = 20
keyHint.Parent = UI.main

local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 180, 1, -86)
sidebar.Position = UDim2.new(0, 18, 0, 72)
sidebar.ZIndex = 11
sidebar.Parent = UI.main
glassify(sidebar, 14, true)

local tabs = {
    {id = "visuals", label = "Visuals", icon = "eye"},
    {id = "combat", label = "Combat", icon = "cross"},
    {id = "cosmetics", label = "Cosmetics", icon = "star"},
    {id = "extras", label = "Extras", icon = "plus"},
    {id = "themes", label = "Themes", icon = "palette"},
    {id = "configs", label = "Configs", icon = "sliders"}
}

local function drawIcon(holder, kind, color)
    if kind == "eye" then
        local eye = Instance.new("Frame")
        eye.Size = UDim2.new(0, 20, 0, 12)
        eye.Position = UDim2.new(0.5, -10, 0.5, -6)
        eye.BackgroundColor3 = color
        eye.BorderSizePixel = 0
        eye.Parent = holder
        local c = Instance.new("UICorner")
        c.CornerRadius = UDim.new(1, 0)
        c.Parent = eye
        local pupil = Instance.new("Frame")
        pupil.Size = UDim2.new(0, 6, 0, 6)
        pupil.Position = UDim2.new(0.5, -3, 0.5, -3)
        pupil.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
        pupil.BorderSizePixel = 0
        pupil.Parent = eye
        local pc = Instance.new("UICorner")
        pc.CornerRadius = UDim.new(1, 0)
        pc.Parent = pupil
    elseif kind == "cross" then
        local ring = Instance.new("Frame")
        ring.Size = UDim2.new(0, 14, 0, 14)
        ring.Position = UDim2.new(0.5, -7, 0.5, -7)
        ring.BackgroundTransparency = 1
        ring.Parent = holder
        local rc = Instance.new("UICorner")
        rc.CornerRadius = UDim.new(1, 0)
        rc.Parent = ring
        local rs = Instance.new("UIStroke")
        rs.Color = color
        rs.Thickness = 1.5
        rs.Parent = ring
        for _, d in ipairs({{0, 0, UDim2.new(0, 20, 0, 2), UDim2.new(0.5, -10, 0.5, -1)}, {0, 0, UDim2.new(0, 2, 0, 20), UDim2.new(0.5, -1, 0.5, -10)}}) do
            local bar = Instance.new("Frame")
            bar.Size = d[3]
            bar.Position = d[4]
            bar.BackgroundColor3 = color
            bar.BorderSizePixel = 0
            bar.Parent = holder
        end
    elseif kind == "star" then
        local lbl = Instance.new("TextLabel")
        lbl.Text = "✦"
        lbl.Font = FONT_BLACK
        lbl.TextSize = 22
        lbl.TextColor3 = color
        lbl.Size = UDim2.new(1, 0, 1, 0)
        lbl.BackgroundTransparency = 1
        lbl.Parent = holder
    elseif kind == "plus" then
        local a = Instance.new("Frame")
        a.Size = UDim2.new(0, 16, 0, 2)
        a.Position = UDim2.new(0.5, -8, 0.5, -1)
        a.BackgroundColor3 = color
        a.BorderSizePixel = 0
        a.Parent = holder
        local b = Instance.new("Frame")
        b.Size = UDim2.new(0, 2, 0, 16)
        b.Position = UDim2.new(0.5, -1, 0.5, -8)
        b.BackgroundColor3 = color
        b.BorderSizePixel = 0
        b.Parent = holder
    elseif kind == "palette" then
        local box = Instance.new("Frame")
        box.Size = UDim2.new(0, 18, 0, 18)
        box.Position = UDim2.new(0.5, -9, 0.5, -9)
        box.BackgroundColor3 = color
        box.BorderSizePixel = 0
        box.Parent = holder
        local bc = Instance.new("UICorner")
        bc.CornerRadius = UDim.new(0, 6)
        bc.Parent = box
        for i = 1, 3 do
            local dot = Instance.new("Frame")
            dot.Size = UDim2.new(0, 3, 0, 3)
            dot.Position = UDim2.new(0, 3 + (i - 1) * 4, 0, 3)
            dot.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
            dot.BorderSizePixel = 0
            dot.Parent = box
        end
    elseif kind == "sliders" then
        for i = 1, 2 do
            local line = Instance.new("Frame")
            line.Size = UDim2.new(0, 18, 0, 2)
            line.Position = UDim2.new(0.5, -9, 0.5, (i == 1 and -5 or 5))
            line.BackgroundColor3 = color
            line.BorderSizePixel = 0
            line.Parent = holder
            local knob = Instance.new("Frame")
            knob.Size = UDim2.new(0, 6, 0, 6)
            knob.Position = UDim2.new(0.5, (i == 1 and -6 or 2), 0.5, (i == 1 and -8 or 2))
            knob.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
            knob.BorderSizePixel = 0
            knob.Parent = holder
            local ks = Instance.new("UIStroke")
            ks.Color = color
            ks.Thickness = 1.5
            ks.Parent = knob
            local kc = Instance.new("UICorner")
            kc.CornerRadius = UDim.new(1, 0)
            kc.Parent = knob
        end
    end
end

UI.tabButtons = {}
UI.tabFrames = {}

local function makeContent()
    local frame = Instance.new("ScrollingFrame")
    frame.Size = UDim2.new(1, -232, 1, -86)
    frame.Position = UDim2.new(0, 214, 0, 72)
    frame.BackgroundTransparency = 1
    frame.BorderSizePixel = 0
    frame.ScrollBarThickness = 4
    frame.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
    frame.CanvasSize = UDim2.new(0, 0, 0, 0)
    frame.Visible = false
    frame.ZIndex = 11
    frame.Parent = UI.main
    local pad = Instance.new("UIPadding")
    pad.PaddingLeft = UDim.new(0, 6)
    pad.PaddingRight = UDim.new(0, 18)
    pad.PaddingTop = UDim.new(0, 4)
    pad.PaddingBottom = UDim.new(0, 20)
    pad.Parent = frame
    local grid = Instance.new("UIGridLayout")
    grid.CellSize = UDim2.new(0.48, 0, 0, 78)
    grid.CellPadding = UDim2.new(0.04, 0, 0, 12)
    grid.SortOrder = Enum.SortOrder.LayoutOrder
    grid.Parent = frame
    grid:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        frame.CanvasSize = UDim2.new(0, 0, 0, grid.AbsoluteContentSize.Y + 30)
    end)
    return frame
end

local function selectTab(index)
    for i, b in ipairs(UI.tabButtons) do
        local active = i == index
        b.bg.BackgroundTransparency = active and 0.82 or 1
        b.stroke.Transparency = active and 0.6 or 1
        b.txt.TextTransparency = active and 0 or 0.45
        b.txt.Font = active and FONT_BOLD or FONT_REG
        UI.tabFrames[i].Visible = active
    end
end

for i, t in ipairs(tabs) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -24, 0, 46)
    btn.Position = UDim2.new(0, 12, 0, 10 + (i - 1) * 52)
    btn.BackgroundTransparency = 1
    btn.Text = ""
    btn.AutoButtonColor = false
    btn.ZIndex = 12
    btn.Parent = sidebar

    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    bg.BackgroundTransparency = 1
    bg.BorderSizePixel = 0
    bg.ZIndex = 12
    bg.Parent = btn
    local bgc = Instance.new("UICorner")
    bgc.CornerRadius = UDim.new(0, 9)
    bgc.Parent = bg
    local bgs = Instance.new("UIStroke")
    bgs.Color = Color3.fromRGB(255, 255, 255)
    bgs.Transparency = 1
    bgs.Thickness = 1.2
    bgs.Parent = bg

    local holder = Instance.new("Frame")
    holder.Size = UDim2.new(0, 30, 0, 30)
    holder.Position = UDim2.new(0, 8, 0.5, -15)
    holder.BackgroundTransparency = 1
    holder.ZIndex = 13
    holder.Parent = bg
    drawIcon(holder, t.icon, Color3.fromRGB(255, 255, 255))

    local txt = Instance.new("TextLabel")
    txt.Text = t.label
    txt.Font = FONT_REG
    txt.TextSize = 15
    txt.TextColor3 = Color3.fromRGB(255, 255, 255)
    txt.TextTransparency = 0.45
    txt.Size = UDim2.new(1, -44, 1, 0)
    txt.Position = UDim2.new(0, 46, 0, 0)
    txt.TextXAlignment = Enum.TextXAlignment.Left
    txt.BackgroundTransparency = 1
    txt.ZIndex = 13
    txt.Parent = bg

    UI.tabButtons[i] = {btn = btn, bg = bg, stroke = bgs, txt = txt}
    btn.MouseButton1Click:Connect(function()
        selectTab(i)
        playSound(SFX.Click)
    end)

    local frame = makeContent()
    if t.id == "themes" then
        local g = frame:FindFirstChildOfClass("UIGridLayout")
        g.CellSize = UDim2.new(0.31, 0, 0, 52)
    elseif t.id == "configs" then
        local g = frame:FindFirstChildOfClass("UIGridLayout")
        g:Destroy()
        local list = Instance.new("UIListLayout")
        list.Padding = UDim.new(0, 12)
        list.SortOrder = Enum.SortOrder.LayoutOrder
        list.Parent = frame
        list:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            frame.CanvasSize = UDim2.new(0, 0, 0, list.AbsoluteContentSize.Y + 30)
        end)
    end
    UI.tabFrames[i] = frame
end

selectTab(1)
local cards = {}

local function createCard(parent, stateKey, titleText, descText, onToggle, onSettings, wide)
    local card = Instance.new("TextButton")
    if wide then
        card.Size = UDim2.new(1, 0, 0, 78)
    else
        card.Size = UDim2.new(0.48, 0, 0, 78)
    end
    card.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    card.BackgroundTransparency = 0.94
    card.BorderSizePixel = 0
    card.Text = ""
    card.AutoButtonColor = false
    card.ZIndex = 12
    card.Parent = parent
    card.LayoutOrder = #parent:GetChildren() + 20

    local co = Instance.new("UICorner")
    co.CornerRadius = UDim.new(0, 12)
    co.Parent = card
    local st = Instance.new("UIStroke")
    st.Color = Color3.fromRGB(255, 255, 255)
    st.Transparency = 0.9
    st.Thickness = 1
    st.Parent = card

    local bar = Instance.new("Frame")
    bar.Size = UDim2.new(0, 3, 0, 34)
    bar.Position = UDim2.new(0, 10, 0.5, -17)
    bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    bar.BackgroundTransparency = 0.6
    bar.BorderSizePixel = 0
    bar.ZIndex = 13
    bar.Parent = card
    local barc = Instance.new("UICorner")
    barc.CornerRadius = UDim.new(1, 0)
    barc.Parent = bar

    local tl = Instance.new("TextLabel")
    tl.Text = titleText
    tl.Font = FONT_BOLD
    tl.TextSize = 14
    tl.TextColor3 = Color3.fromRGB(255, 255, 255)
    tl.TextTransparency = 0.15
    tl.Size = UDim2.new(1, -70, 0, 20)
    tl.Position = UDim2.new(0, 22, 0, 13)
    tl.TextXAlignment = Enum.TextXAlignment.Left
    tl.BackgroundTransparency = 1
    tl.ZIndex = 13
    tl.Parent = card

    local dl = Instance.new("TextLabel")
    dl.Text = descText or ""
    dl.Font = FONT_REG
    dl.TextSize = 11
    dl.TextColor3 = Color3.fromRGB(255, 255, 255)
    dl.TextTransparency = 0.6
    dl.Size = UDim2.new(1, -70, 0, 32)
    dl.Position = UDim2.new(0, 22, 0, 34)
    dl.TextXAlignment = Enum.TextXAlignment.Left
    dl.TextYAlignment = Enum.TextYAlignment.Top
    dl.TextWrapped = true
    dl.BackgroundTransparency = 1
    dl.ZIndex = 13
    dl.Parent = card

    local checkbox = Instance.new("Frame")
    checkbox.Size = UDim2.new(0, 20, 0, 20)
    checkbox.Position = UDim2.new(1, -32, 0.5, -10)
    checkbox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    checkbox.BackgroundTransparency = 1
    checkbox.BorderSizePixel = 0
    checkbox.ZIndex = 13
    checkbox.Parent = card
    local cbc = Instance.new("UICorner")
    cbc.CornerRadius = UDim.new(0, 6)
    cbc.Parent = checkbox
    local cbs = Instance.new("UIStroke")
    cbs.Color = Color3.fromRGB(255, 255, 255)
    cbs.Transparency = 0.7
    cbs.Thickness = 1.5
    cbs.Parent = checkbox
    local checkMark = Instance.new("TextLabel")
    checkMark.Text = "✓"
    checkMark.Font = FONT_BLACK
    checkMark.TextSize = 15
    checkMark.TextColor3 = Color3.fromRGB(8, 10, 16)
    checkMark.Size = UDim2.new(1, 0, 1, 0)
    checkMark.BackgroundTransparency = 1
    checkMark.Visible = false
    checkMark.ZIndex = 14
    checkMark.Parent = checkbox

    if onSettings then
        local gear = Instance.new("TextButton")
        gear.Text = "•••"
        gear.Font = FONT_BOLD
        gear.TextSize = 14
        gear.TextColor3 = Color3.fromRGB(255, 255, 255)
        gear.TextTransparency = 0.4
        gear.Size = UDim2.new(0, 28, 0, 22)
        gear.Position = UDim2.new(1, -62, 1, -25)
        gear.BackgroundTransparency = 1
        gear.AutoButtonColor = false
        gear.ZIndex = 14
        gear.Parent = card
        gear.MouseButton1Click:Connect(function()
            playSound(SFX.Click)
            onSettings()
        end)
    end

    local function refresh()
        if not card.Parent then return end
        local on = State[stateKey] == true
        local c = accent()
        if on then
            card.BackgroundColor3 = c
            card.BackgroundTransparency = 0.9
            st.Color = c
            st.Transparency = 0.45
            bar.BackgroundColor3 = c
            bar.BackgroundTransparency = 0
            checkbox.BackgroundColor3 = c
            checkbox.BackgroundTransparency = 0
            cbs.Color = c
            cbs.Transparency = 0
            checkMark.TextColor3 = Color3.fromRGB(8, 10, 16)
            checkMark.Visible = true
            tl.TextTransparency = 0
        else
            card.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            card.BackgroundTransparency = 0.94
            st.Color = Color3.fromRGB(255, 255, 255)
            st.Transparency = 0.9
            bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            bar.BackgroundTransparency = 0.6
            checkbox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            checkbox.BackgroundTransparency = 1
            cbs.Color = Color3.fromRGB(255, 255, 255)
            cbs.Transparency = 0.7
            checkMark.Visible = false
            tl.TextTransparency = 0.15
        end
    end

    card.MouseButton1Click:Connect(function()
        local newVal = not (State[stateKey] == true)
        State[stateKey] = newVal
        if newVal then playSound(SFX.On) else playSound(SFX.Off) end
        refresh()
        if onToggle then onToggle(newVal) end
    end)

    card.MouseEnter:Connect(function()
        if State[stateKey] == true then return end
        tween(st, 0.15, {Transparency = 0.6})
        tween(card, 0.15, {BackgroundTransparency = 0.9})
    end)
    card.MouseLeave:Connect(function()
        refresh()
    end)

    table.insert(cards, refresh)
    refresh()
    return card
end

local function syncCards()
    for _, r in ipairs(cards) do
        pcall(r)
    end
end

local function createActionCard(parent, titleText, descText, callback, wide)
    local card = Instance.new("TextButton")
    if wide then
        card.Size = UDim2.new(1, 0, 0, 78)
    else
        card.Size = UDim2.new(0.48, 0, 0, 78)
    end
    card.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    card.BackgroundTransparency = 0.94
    card.BorderSizePixel = 0
    card.Text = ""
    card.AutoButtonColor = false
    card.ZIndex = 12
    card.Parent = parent
    card.LayoutOrder = #parent:GetChildren() + 20
    local co = Instance.new("UICorner")
    co.CornerRadius = UDim.new(0, 12)
    co.Parent = card
    local st = Instance.new("UIStroke")
    st.Color = Color3.fromRGB(255, 255, 255)
    st.Transparency = 0.9
    st.Thickness = 1
    st.Parent = card
    local tl = Instance.new("TextLabel")
    tl.Text = titleText
    tl.Font = FONT_BOLD
    tl.TextSize = 14
    tl.TextColor3 = Color3.fromRGB(255, 255, 255)
    tl.TextTransparency = 0.15
    tl.Size = UDim2.new(1, -76, 0, 20)
    tl.Position = UDim2.new(0, 18, 0, 13)
    tl.TextXAlignment = Enum.TextXAlignment.Left
    tl.BackgroundTransparency = 1
    tl.ZIndex = 13
    tl.Parent = card
    local dl = Instance.new("TextLabel")
    dl.Text = descText or ""
    dl.Font = FONT_REG
    dl.TextSize = 11
    dl.TextColor3 = Color3.fromRGB(255, 255, 255)
    dl.TextTransparency = 0.6
    dl.Size = UDim2.new(1, -76, 0, 32)
    dl.Position = UDim2.new(0, 18, 0, 34)
    dl.TextXAlignment = Enum.TextXAlignment.Left
    dl.TextWrapped = true
    dl.BackgroundTransparency = 1
    dl.ZIndex = 13
    dl.Parent = card
    local arrow = Instance.new("TextLabel")
    arrow.Text = "→"
    arrow.Font = FONT_BLACK
    arrow.TextSize = 20
    arrow.TextColor3 = Color3.fromRGB(255, 255, 255)
    arrow.TextTransparency = 0.45
    arrow.Size = UDim2.new(0, 28, 1, 0)
    arrow.Position = UDim2.new(1, -40, 0, 0)
    arrow.BackgroundTransparency = 1
    arrow.ZIndex = 13
    arrow.Parent = card
    card.MouseButton1Click:Connect(function()
        playSound(SFX.Click)
        if callback then callback() end
    end)
    card.MouseEnter:Connect(function()
        tween(st, 0.15, {Transparency = 0.5, Color = accent()})
        tween(card, 0.15, {BackgroundTransparency = 0.9})
    end)
    card.MouseLeave:Connect(function()
        tween(st, 0.15, {Transparency = 0.9, Color = Color3.fromRGB(255, 255, 255)})
        tween(card, 0.15, {BackgroundTransparency = 0.94})
    end)
    return card
end

local settingsWin = nil

local function closeSettings()
    if settingsWin then settingsWin:Destroy(); settingsWin = nil end
    if State.MenuOpen then
        UI.main.Visible = true
        dim.Visible = true
        dim.BackgroundTransparency = 0.5
    else
        dim.Visible = false
    end
end

local function addSliderRow(parent, labelText, minV, maxV, initV, decimals, cb)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, 0, 0, 54)
    row.BackgroundTransparency = 1
    row.ZIndex = 602
    row.Parent = parent

    local lbl = Instance.new("TextLabel")
    lbl.Text = labelText
    lbl.Font = FONT_REG
    lbl.TextSize = 13
    lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    lbl.TextTransparency = 0.4
    lbl.Size = UDim2.new(1, -70, 0, 20)
    lbl.Position = UDim2.new(0, 4, 0, 0)
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.BackgroundTransparency = 1
    lbl.ZIndex = 602
    lbl.Parent = row

    local val = Instance.new("TextLabel")
    val.Text = string.format("%." .. tostring(decimals) .. "f", initV)
    val.Font = FONT_BOLD
    val.TextSize = 13
    val.TextColor3 = accent()
    val.Size = UDim2.new(0, 66, 0, 20)
    val.Position = UDim2.new(1, -70, 0, 0)
    val.TextXAlignment = Enum.TextXAlignment.Right
    val.BackgroundTransparency = 1
    val.ZIndex = 602
    val.Parent = row
    bindTheme(function(c) val.TextColor3 = c end)

    local track = Instance.new("Frame")
    track.Size = UDim2.new(1, -8, 0, 6)
    track.Position = UDim2.new(0, 4, 0, 30)
    track.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    track.BackgroundTransparency = 0.8
    track.BorderSizePixel = 0
    track.ZIndex = 602
    track.Parent = row
    local tc = Instance.new("UICorner")
    tc.CornerRadius = UDim.new(1, 0)
    tc.Parent = track

    local ratio = (initV - minV) / math.max(maxV - minV, 0.0001)
    local fill = Instance.new("Frame")
    fill.Size = UDim2.new(ratio, 0, 1, 0)
    fill.BackgroundColor3 = accent()
    fill.BorderSizePixel = 0
    fill.ZIndex = 603
    fill.Parent = track
    local fc = Instance.new("UICorner")
    fc.CornerRadius = UDim.new(1, 0)
    fc.Parent = fill
    bindTheme(function(c) fill.BackgroundColor3 = c end)

    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0, 14, 0, 14)
    knob.Position = UDim2.new(ratio, -7, 0.5, -7)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knob.BorderSizePixel = 0
    knob.ZIndex = 604
    knob.Parent = track
    local kc = Instance.new("UICorner")
    kc.CornerRadius = UDim.new(1, 0)
    kc.Parent = knob

    local dragging = false
    local function update()
        local mx = UserInputService:GetMouseLocation().X
        local ax = track.AbsolutePosition.X
        local w = track.AbsoluteSize.X
        local r = clamp((mx - ax) / math.max(w, 1), 0, 1)
        fill.Size = UDim2.new(r, 0, 1, 0)
        knob.Position = UDim2.new(r, -7, 0.5, -7)
        local v = minV + (maxV - minV) * r
        val.Text = string.format("%." .. tostring(decimals) .. "f", v)
        cb(v)
    end

    track.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            update()
        end
    end)
    knob.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            update()
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
end

local function addToggleRow(parent, labelText, getter, setter)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, 0, 0, 38)
    row.BackgroundTransparency = 1
    row.ZIndex = 602
    row.Parent = parent

    local lbl = Instance.new("TextLabel")
    lbl.Text = labelText
    lbl.Font = FONT_REG
    lbl.TextSize = 13
    lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    lbl.TextTransparency = 0.35
    lbl.Size = UDim2.new(1, -70, 1, 0)
    lbl.Position = UDim2.new(0, 4, 0, 0)
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.BackgroundTransparency = 1
    lbl.ZIndex = 602
    lbl.Parent = row

    local sw = Instance.new("TextButton")
    sw.Size = UDim2.new(0, 40, 0, 20)
    sw.Position = UDim2.new(1, -44, 0.5, -10)
    sw.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    sw.BackgroundTransparency = 0.75
    sw.BorderSizePixel = 0
    sw.Text = ""
    sw.AutoButtonColor = false
    sw.ZIndex = 602
    sw.Parent = row
    local sc = Instance.new("UICorner")
    sc.CornerRadius = UDim.new(1, 0)
    sc.Parent = sw
    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0, 16, 0, 16)
    knob.Position = UDim2.new(0, 2, 0.5, -8)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knob.BorderSizePixel = 0
    knob.ZIndex = 603
    knob.Parent = sw
    local knc = Instance.new("UICorner")
    knc.CornerRadius = UDim.new(1, 0)
    knc.Parent = knob

    local function refresh()
        local on = getter()
        if on then
            sw.BackgroundColor3 = accent()
            sw.BackgroundTransparency = 0.15
            knob.Position = UDim2.new(1, -18, 0.5, -8)
        else
            sw.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            sw.BackgroundTransparency = 0.75
            knob.Position = UDim2.new(0, 2, 0.5, -8)
        end
    end
    bindTheme(refresh)

    sw.MouseButton1Click:Connect(function()
        setter(not getter())
        refresh()
        playSound(SFX.Click)
    end)
    refresh()
end

local function addColorRow(parent, labelText, current, cb)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, 0, 0, 40)
    row.BackgroundTransparency = 1
    row.ZIndex = 602
    row.Parent = parent

    local lbl = Instance.new("TextLabel")
    lbl.Text = labelText
    lbl.Font = FONT_REG
    lbl.TextSize = 13
    lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    lbl.TextTransparency = 0.35
    lbl.Size = UDim2.new(0, 100, 1, 0)
    lbl.Position = UDim2.new(0, 4, 0, 0)
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.BackgroundTransparency = 1
    lbl.ZIndex = 602
    lbl.Parent = row

    local palette = {
        Color3.fromRGB(255, 170, 200),
        Color3.fromRGB(255, 80, 100),
        Color3.fromRGB(0, 229, 255),
        Color3.fromRGB(160, 240, 90),
        Color3.fromRGB(186, 120, 255),
        Color3.fromRGB(255, 205, 80),
        Color3.fromRGB(255, 255, 255)
    }
    for i, col in ipairs(palette) do
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(0, 20, 0, 20)
        b.Position = UDim2.new(0, 100 + (i - 1) * 26, 0.5, -10)
        b.BackgroundColor3 = col
        b.BorderSizePixel = 0
        b.Text = ""
        b.AutoButtonColor = false
        b.ZIndex = 602
        b.Parent = row
        local c = Instance.new("UICorner")
        c.CornerRadius = UDim.new(1, 0)
        c.Parent = b
        local s = Instance.new("UIStroke")
        s.Color = Color3.fromRGB(255, 255, 255)
        s.Transparency = 0.6
        s.Thickness = 1
        s.Parent = b
        b.MouseButton1Click:Connect(function()
            cb(col)
            playSound(SFX.Click)
        end)
    end
end

local function openSettings(titleText, build)
    if settingsWin then settingsWin:Destroy(); settingsWin = nil end
    UI.main.Visible = false
    dim.Visible = true
    dim.ZIndex = 550
    dim.BackgroundTransparency = 1
    tween(dim, 0.3, {BackgroundTransparency = 0.55})

    local win = Instance.new("Frame")
    win.Size = UDim2.new(0, 400, 0, 340)
    win.Position = UDim2.new(0.5, -200, 0.5, -170)
    win.ZIndex = 600
    win.Parent = screenGui
    glassify(win, 18, false)
    settingsWin = win

    local hdr = Instance.new("Frame")
    hdr.Size = UDim2.new(1, 0, 0, 54)
    hdr.BackgroundTransparency = 1
    hdr.ZIndex = 601
    hdr.Parent = win
    local hl = Instance.new("Frame")
    hl.Size = UDim2.new(1, 0, 0, 1)
    hl.Position = UDim2.new(0, 0, 1, -1)
    hl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    hl.BackgroundTransparency = 0.88
    hl.BorderSizePixel = 0
    hl.ZIndex = 601
    hl.Parent = hdr
    local tl = Instance.new("TextLabel")
    tl.Text = titleText
    tl.Font = FONT_BLACK
    tl.TextSize = 17
    tl.TextColor3 = Color3.fromRGB(255, 255, 255)
    tl.Size = UDim2.new(1, -70, 1, 0)
    tl.Position = UDim2.new(0, 22, 0, 0)
    tl.TextXAlignment = Enum.TextXAlignment.Left
    tl.BackgroundTransparency = 1
    tl.ZIndex = 602
    tl.Parent = hdr
    local cb = Instance.new("TextButton")
    cb.Text = "×"
    cb.Font = FONT_REG
    cb.TextSize = 24
    cb.TextColor3 = Color3.fromRGB(255, 255, 255)
    cb.TextTransparency = 0.4
    cb.Size = UDim2.new(0, 32, 0, 32)
    cb.Position = UDim2.new(1, -42, 0.5, -16)
    cb.BackgroundTransparency = 1
    cb.AutoButtonColor = false
    cb.ZIndex = 602
    cb.Parent = hdr
    cb.MouseButton1Click:Connect(function()
        closeSettings()
        playSound(SFX.Close)
    end)

    local content = Instance.new("ScrollingFrame")
    content.Size = UDim2.new(1, -32, 1, -66)
    content.Position = UDim2.new(0, 16, 0, 60)
    content.BackgroundTransparency = 1
    content.BorderSizePixel = 0
    content.ScrollBarThickness = 3
    content.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
    content.CanvasSize = UDim2.new(0, 0, 0, 0)
    content.ZIndex = 602
    content.Parent = win
    local list = Instance.new("UIListLayout")
    list.Padding = UDim.new(0, 8)
    list.SortOrder = Enum.SortOrder.LayoutOrder
    list.Parent = content
    list:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        content.CanvasSize = UDim2.new(0, 0, 0, list.AbsoluteContentSize.Y + 10)
    end)

    build(content)
end
local visualTab = UI.tabFrames[1]

createCard(visualTab, "FogEnabled", "Fog", "Atmospheric fog effect.", function() applyFog() end, function()
    openSettings("FOG SETTINGS", function(c)
        addSliderRow(c, "Density", 0, 1, State.FogDensity, 2, function(v) State.FogDensity = v; applyFog() end)
        addSliderRow(c, "Offset", -1, 1, State.FogOffset, 2, function(v) State.FogOffset = v; applyFog() end)
    end)
end)

createCard(visualTab, "FullbrightEnabled", "Fullbright", "Maximum brightness.", function() applyFullbright() end, function()
    openSettings("FULLBRIGHT", function(c)
        addSliderRow(c, "Brightness", 1, 10, State.FullbrightBrightness, 1, function(v) State.FullbrightBrightness = v; applyFullbright() end)
    end)
end)

createCard(visualTab, "MotionBlurEnabled", "Motion Blur", "Blur while moving camera.", nil, function()
    openSettings("MOTION BLUR", function(c)
        addSliderRow(c, "Strength", 0, 56, State.MotionBlurStrength, 0, function(v) State.MotionBlurStrength = v end)
    end)
end)

createCard(visualTab, "WorldEnabled", "World Color", "Color correction filter.", function() applyWorld() end, function()
    openSettings("WORLD COLOR", function(c)
        addSliderRow(c, "Saturation", -1, 1, State.WorldSaturation, 2, function(v) State.WorldSaturation = v; applyWorld() end)
        addSliderRow(c, "Contrast", -1, 1, State.WorldContrast, 2, function(v) State.WorldContrast = v; applyWorld() end)
    end)
end)

createCard(visualTab, "ESPEnabled", "ESP 2D", "Boxes, names and distance.", function() applyESP() end, function()
    openSettings("ESP SETTINGS", function(c)
        addToggleRow(c, "Show names", function() return State.ESPShowName end, function(v)
            State.ESPShowName = v
            updateESPColors()
        end)
        addToggleRow(c, "Show distance", function() return State.ESPShowDistance end, function(v)
            State.ESPShowDistance = v
            updateESPColors()
        end)
        addColorRow(c, "ESP color", State.ESPColor, function(col)
            State.ESPColor = col
            updateESPColors()
        end)
    end)
end)

createCard(visualTab, "AspectEnabled", "Aspect", "Screen stretching.", nil, function()
    openSettings("ASPECT RATIO", function(c)
        addSliderRow(c, "Value", 0.5, 1.5, State.AspectValue, 2, function(v) State.AspectValue = v end)
    end)
end)

createCard(visualTab, "WatermarkEnabled", "Watermark", "FPS and ping overlay.", nil, nil)

local combatTab = UI.tabFrames[2]

createCard(combatTab, "AimBotEnabled", "Aimbot", "Locks camera on target.", nil, function()
    openSettings("AIMBOT", function(c)
        addSliderRow(c, "FOV", 20, 500, State.AimBotFOV, 0, function(v) State.AimBotFOV = v end)
        addSliderRow(c, "Smoothness", 0, 0.95, State.AimBotSmooth, 2, function(v) State.AimBotSmooth = v end)
        addToggleRow(c, "Aim at Head", function() return State.AimBotPart == "Head" end, function(v)
            State.AimBotPart = v and "Head" or "HumanoidRootPart"
        end)
    end)
end)

createCard(combatTab, "HitboxEnabled", "Hitbox Expander", "Bigger hitboxes for players.", nil, function()
    openSettings("HITBOX", function(c)
        addSliderRow(c, "Size", 2, 30, State.HitboxSize, 0, function(v) State.HitboxSize = v end)
    end)
end)

createCard(combatTab, "SpeedEnabled", "Speed", "Custom walkspeed.", nil, function()
    openSettings("SPEED", function(c)
        addSliderRow(c, "WalkSpeed", 16, 200, State.SpeedValue, 0, function(v) State.SpeedValue = v end)
    end)
end)

createCard(combatTab, "JumpEnabled", "Jump Power", "Custom jump height.", nil, function()
    openSettings("JUMP POWER", function(c)
        addSliderRow(c, "Power", 50, 300, State.JumpValue, 0, function(v) State.JumpValue = v end)
    end)
end)

createCard(combatTab, "InfJumpEnabled", "Infinite Jump", "Jump in mid-air.", nil, nil)

createCard(combatTab, "FlyEnabled", "Fly", "WASD + Space / Ctrl.", nil, function()
    openSettings("FLY", function(c)
        addSliderRow(c, "Speed", 10, 200, State.FlySpeed, 0, function(v) State.FlySpeed = v end)
    end)
end)

createCard(combatTab, "NoclipEnabled", "Noclip", "Walk through walls.", nil, nil)

createCard(combatTab, "AutoCollectEnabled", "Auto Collect", "Teleports to nearest pickups.", nil, nil)

createActionCard(combatTab, "Kamikaze Drone", "Fly to nearest player and explode.", function()
    if State.DroneActive then stopDrone() else startDrone() end
end)

local antiAfkConn = nil
local function toggleAntiAfk(on)
    State.AntiAfkEnabled = on
    if on then
        if not antiAfkConn then
            antiAfkConn = player.Idled:Connect(function()
                local vu = game:GetService("VirtualUser")
                pcall(function()
                    vu:CaptureController()
                    vu:ClickButton2(Vector2.new())
                end)
            end)
        end
    else
        if antiAfkConn then antiAfkConn:Disconnect(); antiAfkConn = nil end
    end
end

createCard(combatTab, "AntiAfkEnabled", "Anti AFK", "Prevents idle kick.", toggleAntiAfk, nil)

local extrasTab = UI.tabFrames[4]

local function setAvatarScale(v)
    State.AvatarScale = v
    local char = player.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    for _, n in ipairs({"BodyHeightScale", "BodyWidthScale", "BodyDepthScale", "HeadScale"}) do
        local nv = hum:FindFirstChild(n)
        if nv then nv.Value = v end
    end
end

local function teleportToMouse()
    local char = player.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    local m = UserInputService:GetMouseLocation()
    local ray = camera:ViewportPointToRay(m.X, m.Y)
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Exclude
    params.FilterDescendantsInstances = {char}
    local hit = Workspace:Raycast(ray.Origin, ray.Direction * 2000, params)
    if hit then
        root.CFrame = CFrame.new(hit.Position + Vector3.new(0, 3, 0))
    end
end

createActionCard(extrasTab, "Rejoin Server", "Reconnect to current place.", function()
    pcall(function() TeleportService:Teleport(game.PlaceId, player) end)
end)

createActionCard(extrasTab, "Reset Character", "Respawn your avatar.", function()
    local char = player.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then hum.Health = 0 end
    end
end)

createActionCard(extrasTab, "Copy Job ID", "Copy server ID to clipboard.", function()
    if setclipboard then
        pcall(function() setclipboard(tostring(game.JobId)) end)
    end
end)

createActionCard(extrasTab, "Teleport To Mouse", "Move to the part under cursor.", teleportToMouse)

createCard(extrasTab, "AntiAfkEnabled", "Anti AFK", "Prevents idle kick.", toggleAntiAfk, nil)

createActionCard(extrasTab, "Avatar Scale", "Change your character size.", function()
    openSettings("AVATAR SCALE", function(c)
        addSliderRow(c, "Scale", 0.3, 2, State.AvatarScale, 2, setAvatarScale)
    end)
end)

createActionCard(extrasTab, "Destroy GUI", "Unload hamer client.", function()
    ScriptUnloaded = true
    for _, conn in ipairs(Connections) do
        pcall(function() conn:Disconnect() end)
    end
    destroyAllESP()
    if screenGui then screenGui:Destroy() end
    if espGui then espGui:Destroy() end
end)
local cosmeticsFrame = UI.tabFrames[3]
local oldGrid = cosmeticsFrame:FindFirstChildOfClass("UIGridLayout")
if oldGrid then oldGrid:Destroy() end
cosmeticsFrame.CanvasSize = UDim2.new(0, 0, 0, 0)

local subCont = Instance.new("Frame")
subCont.Size = UDim2.new(1, 0, 0, 38)
subCont.BackgroundTransparency = 1
subCont.ZIndex = 12
subCont.Parent = cosmeticsFrame
local subList = Instance.new("UIListLayout")
subList.FillDirection = Enum.FillDirection.Horizontal
subList.SortOrder = Enum.SortOrder.LayoutOrder
subList.Padding = UDim.new(0, 8)
subList.VerticalAlignment = Enum.VerticalAlignment.Center
subList.Parent = subCont

local cosContent = Instance.new("ScrollingFrame")
cosContent.Size = UDim2.new(1, 0, 1, -46)
cosContent.Position = UDim2.new(0, 0, 0, 46)
cosContent.BackgroundTransparency = 1
cosContent.BorderSizePixel = 0
cosContent.ScrollBarThickness = 3
cosContent.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
cosContent.CanvasSize = UDim2.new(0, 0, 0, 0)
cosContent.ZIndex = 12
cosContent.Parent = cosmeticsFrame
local cosList = Instance.new("UIListLayout")
cosList.Padding = UDim.new(0, 10)
cosList.SortOrder = Enum.SortOrder.LayoutOrder
cosList.Parent = cosContent
cosList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    cosContent.CanvasSize = UDim2.new(0, 0, 0, cosList.AbsoluteContentSize.Y + 10)
end)

local subButtons = {}
local currentSub = nil

local function populateBody()
    createCard(cosContent, "KorbloxEnabled", "Korblox Style", "Hides right leg.", function(v) applyKorblox(v) end, nil, true)
    createCard(cosContent, "GhostLegsEnabled", "Ghost Legs", "Hides both legs.", function(v) applyGhostLegs(v) end, nil, true)
    createCard(cosContent, "DongEnabled", "3D Dick", "3D model attached to the torso.", function() applyDong() end, function()
        openSettings("3D DICK", function(c)
            addSliderRow(c, "Size", 0.4, 3, State.DongSize, 2, function(v)
                State.DongSize = v
                if State.DongEnabled then applyDong() end
            end)
            addToggleRow(c, "Glow", function() return State.DongGlow end, function(v)
                State.DongGlow = v
                if State.DongEnabled then applyDong() end
            end)
            addColorRow(c, "Color", State.DongColor, function(col)
                State.DongColor = col
                if State.DongEnabled then applyDong() end
            end)
        end)
    end, true)
end

local function populateWings()
    createCard(cosContent, "WingsEnabled", "Angel Wings", "Glowing wings behind your back.", function() applyWings() end, nil, true)
end

local function populateHats()
    createCard(cosContent, "ChinaHatEnabled", "China Hat", "Glowing conical hat.", function() applyChinaHat() end, nil, true)
    createCard(cosContent, "HaloEnabled", "Halo", "Spinning ring above your head.", function() applyHalo() end, nil, true)
end

local function populatePets()
    createCard(cosContent, "CompanionEnabled", "Companion", "Floating cube pet.", function() applyCompanion() end, nil, true)
    createCard(cosContent, "KaguneEnabled", "Kagune", "Tokyo Ghoul tentacles.", function() applyKagune() end, nil, true)
end

local function populateAnims()
    createCard(cosContent, "NoAnimsEnabled", "No Animations", "Stops character animations.", function(v) applyNoAnims(v) end, nil, true)
    createActionCard(cosContent, "Emote Menu", "Open the quick emote panel.", function() toggleEmoteMenu() end, true)
end

local subDefs = {
    {id = "body", label = "Body", fill = populateBody},
    {id = "wings", label = "Wings", fill = populateWings},
    {id = "hats", label = "Hats", fill = populateHats},
    {id = "pets", label = "Pets", fill = populatePets},
    {id = "anims", label = "Anims", fill = populateAnims}
}

local function switchSub(id)
    if currentSub == id then return end
    currentSub = id
    for sid, b in pairs(subButtons) do
        local on = sid == id
        b.btn.BackgroundTransparency = on and 0.2 or 0.95
        b.stroke.Transparency = on and 0.4 or 0.9
        b.btn.TextTransparency = on and 0 or 0.5
    end
    for _, ch in ipairs(cosContent:GetChildren()) do
        if ch:IsA("TextButton") or ch:IsA("Frame") then ch:Destroy() end
    end
    for _, d in ipairs(subDefs) do
        if d.id == id then d.fill() end
    end
end

for i, d in ipairs(subDefs) do
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0, 76, 0, 30)
    b.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    b.BackgroundTransparency = 0.95
    b.Text = d.label
    b.Font = FONT_BOLD
    b.TextSize = 12
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.TextTransparency = 0.5
    b.AutoButtonColor = false
    b.LayoutOrder = i
    b.ZIndex = 13
    b.Parent = subCont
    local bc = Instance.new("UICorner")
    bc.CornerRadius = UDim.new(0, 8)
    bc.Parent = b
    local bs = Instance.new("UIStroke")
    bs.Color = Color3.fromRGB(255, 255, 255)
    bs.Transparency = 0.9
    bs.Thickness = 1
    bs.Parent = b
    subButtons[d.id] = {btn = b, stroke = bs}
    b.MouseButton1Click:Connect(function()
        switchSub(d.id)
        playSound(SFX.Click)
    end)
end
switchSub("body")

local themeFrame = UI.tabFrames[5]
for i, tName in ipairs(ThemeOrder) do
    local col = Themes[tName]
    local c = Instance.new("TextButton")
    c.Size = UDim2.new(1, 0, 1, 0)
    c.BackgroundColor3 = col
    c.BackgroundTransparency = 0.86
    c.BorderSizePixel = 0
    c.Text = ""
    c.AutoButtonColor = false
    c.ZIndex = 12
    c.Parent = themeFrame
    local co = Instance.new("UICorner")
    co.CornerRadius = UDim.new(0, 10)
    co.Parent = c
    local st = Instance.new("UIStroke")
    st.Color = col
    st.Transparency = 0.4
    st.Thickness = 1
    st.Parent = c
    local dot = Instance.new("Frame")
    dot.Size = UDim2.new(0, 12, 0, 12)
    dot.Position = UDim2.new(0, 10, 0.5, -6)
    dot.BackgroundColor3 = col
    dot.BorderSizePixel = 0
    dot.ZIndex = 13
    dot.Parent = c
    local dc = Instance.new("UICorner")
    dc.CornerRadius = UDim.new(1, 0)
    dc.Parent = dot
    local tl = Instance.new("TextLabel")
    tl.Text = tName
    tl.Font = FONT_BOLD
    tl.TextSize = 12
    tl.TextColor3 = Color3.fromRGB(255, 255, 255)
    tl.TextTransparency = 0.15
    tl.Size = UDim2.new(1, -30, 1, 0)
    tl.Position = UDim2.new(0, 28, 0, 0)
    tl.TextXAlignment = Enum.TextXAlignment.Left
    tl.BackgroundTransparency = 1
    tl.ZIndex = 13
    tl.Parent = c
    c.MouseButton1Click:Connect(function()
        State.CurrentTheme = tName
        refreshTheme()
        syncCards()
        updateESPColors()
        if State.WingsEnabled then applyWings() end
        if State.ChinaHatEnabled then applyChinaHat() end
        if State.CompanionEnabled then applyCompanion() end
        if State.HaloEnabled then applyHalo() end
        playSound(SFX.On)
    end)
end

local configFrame = UI.tabFrames[6]
local CONFIG_DIR = "hamer_configs"

local function hasFileAPI()
    return type(writefile) == "function" and type(readfile) == "function"
end

local nameBox = Instance.new("TextBox")
nameBox.Size = UDim2.new(1, 0, 0, 40)
nameBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
nameBox.BackgroundTransparency = 0.92
nameBox.BorderSizePixel = 0
nameBox.Font = FONT_REG
nameBox.TextSize = 14
nameBox.TextColor3 = Color3.fromRGB(255, 255, 255)
nameBox.PlaceholderText = "config name..."
nameBox.PlaceholderColor3 = Color3.fromRGB(150, 160, 180)
nameBox.Text = "default"
nameBox.ClearTextOnFocus = false
nameBox.ZIndex = 12
nameBox.LayoutOrder = 1
nameBox.Parent = configFrame
local nbc = Instance.new("UICorner")
nbc.CornerRadius = UDim.new(0, 8)
nbc.Parent = nameBox
local nbs = Instance.new("UIStroke")
nbs.Color = Color3.fromRGB(255, 255, 255)
nbs.Transparency = 0.8
nbs.Thickness = 1
nbs.Parent = nameBox

local cfgStatus = Instance.new("TextLabel")
cfgStatus.Text = hasFileAPI() and "ready" or "file api unavailable"
cfgStatus.Font = FONT_REG
cfgStatus.TextSize = 12
cfgStatus.TextColor3 = Color3.fromRGB(255, 255, 255)
cfgStatus.TextTransparency = 0.5
cfgStatus.Size = UDim2.new(1, 0, 0, 22)
cfgStatus.BackgroundTransparency = 1
cfgStatus.TextXAlignment = Enum.TextXAlignment.Left
cfgStatus.ZIndex = 12
cfgStatus.LayoutOrder = 2
cfgStatus.Parent = configFrame

local function safeName(n)
    n = tostring(n or "default")
    n = string.gsub(n, "[^%w_%- ]", "")
    if n == "" then n = "default" end
    return n
end

local function serialize()
    local t = {}
    for k, v in pairs(State) do
        if (type(v) == "boolean" or type(v) == "number" or type(v) == "string") and k ~= "MenuOpen" and k ~= "DroneActive" then
            t[k] = v
        end
    end
    t.ESPColor = {math.floor(State.ESPColor.R * 255), math.floor(State.ESPColor.G * 255), math.floor(State.ESPColor.B * 255)}
    t.DongColor = {math.floor(State.DongColor.R * 255), math.floor(State.DongColor.G * 255), math.floor(State.DongColor.B * 255)}
    return HttpService:JSONEncode(t)
end

local function reapplyAll()
    applyFog()
    applyFullbright()
    applyWorld()
    applyESP()
    applyWings()
    applyChinaHat()
    applyKagune()
    applyCompanion()
    applyHalo()
    applyDong()
    applyKorblox(State.KorbloxEnabled)
    applyGhostLegs(State.GhostLegsEnabled)
    applyNoAnims(State.NoAnimsEnabled)
    setAvatarScale(State.AvatarScale)
    refreshTheme()
    syncCards()
    updateESPColors()
end

local function saveConfig()
    if not hasFileAPI() then cfgStatus.Text = "file api unavailable"; return end
    local ok, err = pcall(function()
        if type(makefolder) == "function" and type(isfolder) == "function" and not isfolder(CONFIG_DIR) then
            makefolder(CONFIG_DIR)
        end
        writefile(CONFIG_DIR .. "/" .. safeName(nameBox.Text) .. ".json", serialize())
    end)
    cfgStatus.Text = ok and "saved" or ("save failed: " .. tostring(err))
end

local function loadConfig()
    if not hasFileAPI() then cfgStatus.Text = "file api unavailable"; return end
    local path = CONFIG_DIR .. "/" .. safeName(nameBox.Text) .. ".json"
    local ok, data = pcall(function() return readfile(path) end)
    if not ok or not data then cfgStatus.Text = "config not found"; return end
    local decOk, decoded = pcall(function() return HttpService:JSONDecode(data) end)
    if not decOk or type(decoded) ~= "table" then cfgStatus.Text = "broken config"; return end
    for k, v in pairs(decoded) do
        if k ~= "ESPColor" and k ~= "DongColor" and State[k] ~= nil then
            if type(State[k]) == type(v) then State[k] = v end
        end
    end
    if type(decoded.ESPColor) == "table" then
        State.ESPColor = Color3.fromRGB(decoded.ESPColor[1] or 0, decoded.ESPColor[2] or 229, decoded.ESPColor[3] or 255)
    end
    if type(decoded.DongColor) == "table" then
        State.DongColor = Color3.fromRGB(decoded.DongColor[1] or 255, decoded.DongColor[2] or 170, decoded.DongColor[3] or 200)
    end
    reapplyAll()
    cfgStatus.Text = "loaded"
end

local function deleteConfig()
    if not hasFileAPI() then cfgStatus.Text = "file api unavailable"; return end
    local path = CONFIG_DIR .. "/" .. safeName(nameBox.Text) .. ".json"
    local ok = pcall(function() if type(delfile) == "function" then delfile(path) end end)
    cfgStatus.Text = ok and "deleted" or "delete failed"
end

createActionCard(configFrame, "Save Config", "Write current settings to file.", saveConfig, true)
createActionCard(configFrame, "Load Config", "Apply saved settings.", loadConfig, true)
createActionCard(configFrame, "Delete Config", "Remove saved config.", deleteConfig, true)

local EmoteMenu = {gui = nil, frame = nil, track = nil}
local EMOTES = {
    {name = "Dance", id = "507771019"},
    {name = "Cheer", id = "507770677"},
    {name = "Hello", id = "507770239"},
    {name = "Point", id = "507770453"},
    {name = "Laugh", id = "507770818"},
    {name = "Sit", id = "2506281703"}
}

local function playEmote(id, isSit)
    local char = player.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    local animator = hum:FindFirstChildOfClass("Animator")
    if not animator then
        animator = Instance.new("Animator")
        animator.Parent = hum
    end
    if EmoteMenu.track then pcall(function() EmoteMenu.track:Stop() end) end
    local anim = Instance.new("Animation")
    anim.AnimationId = "rbxassetid://" .. id
    local ok, track = pcall(function() return animator:LoadAnimation(anim) end)
    if ok and track then
        track.Priority = Enum.AnimationPriority.Action4
        track.Looped = isSit == true
        track:Play()
        EmoteMenu.track = track
    end
end

function toggleEmoteMenu()
    if EmoteMenu.gui and EmoteMenu.gui.Parent then
        EmoteMenu.gui:Destroy()
        EmoteMenu.gui = nil
        return
    end
    local gui = Instance.new("ScreenGui")
    gui.Name = "HamerEmotes"
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true
    gui.DisplayOrder = 90
    gui.Parent = player:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 170, 0, 258)
    frame.Position = UDim2.new(1, -190, 0.5, -129)
    frame.ZIndex = 90
    frame.Parent = gui
    glassify(frame, 16, false)

    local tl = Instance.new("TextLabel")
    tl.Text = "EMOTES"
    tl.Font = FONT_BLACK
    tl.TextSize = 14
    tl.TextColor3 = Color3.fromRGB(255, 255, 255)
    tl.Size = UDim2.new(1, -20, 0, 26)
    tl.Position = UDim2.new(0, 12, 0, 8)
    tl.TextXAlignment = Enum.TextXAlignment.Left
    tl.BackgroundTransparency = 1
    tl.ZIndex = 91
    tl.Parent = frame

    for i, e in ipairs(EMOTES) do
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(1, -24, 0, 28)
        b.Position = UDim2.new(0, 12, 0, 40 + (i - 1) * 32)
        b.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        b.BackgroundTransparency = 0.94
        b.BorderSizePixel = 0
        b.Text = e.name
        b.Font = FONT_REG
        b.TextSize = 12
        b.TextColor3 = Color3.fromRGB(255, 255, 255)
        b.TextTransparency = 0.25
        b.AutoButtonColor = false
        b.ZIndex = 91
        b.Parent = frame
        local bc = Instance.new("UICorner")
        bc.CornerRadius = UDim.new(0, 8)
        bc.Parent = b
        local bs = Instance.new("UIStroke")
        bs.Color = Color3.fromRGB(255, 255, 255)
        bs.Transparency = 0.9
        bs.Parent = b
        b.MouseButton1Click:Connect(function()
            playEmote(e.id, e.name == "Sit")
            playSound(SFX.Click)
        end)
    end

    EmoteMenu.gui = gui
    EmoteMenu.frame = frame
end
local aimCircle = Instance.new("Frame")
aimCircle.AnchorPoint = Vector2.new(0.5, 0.5)
aimCircle.Position = UDim2.new(0.5, 0, 0.5, 0)
aimCircle.BackgroundTransparency = 1
aimCircle.BorderSizePixel = 0
aimCircle.Visible = false
aimCircle.ZIndex = 4
aimCircle.Parent = screenGui
local aimCorner = Instance.new("UICorner")
aimCorner.CornerRadius = UDim.new(1, 0)
aimCorner.Parent = aimCircle
local aimStroke = Instance.new("UIStroke")
aimStroke.Color = accent()
aimStroke.Thickness = 1.5
aimStroke.Transparency = 0.35
aimStroke.Parent = aimCircle
bindTheme(function(c) aimStroke.Color = c end)

local wmGui = Instance.new("ScreenGui")
wmGui.Name = "HamerWatermark"
wmGui.ResetOnSpawn = false
wmGui.IgnoreGuiInset = true
wmGui.DisplayOrder = 998
wmGui.Parent = player:WaitForChild("PlayerGui")

local wm = Instance.new("Frame")
wm.Size = UDim2.new(0, 230, 0, 30)
wm.Position = UDim2.new(0, 12, 0, 12)
wm.ZIndex = 998
wm.Parent = wmGui
glassify(wm, 9, false)

local wmText = Instance.new("TextLabel")
wmText.Text = "hamer"
wmText.Font = FONT_BOLD
wmText.TextSize = 11
wmText.TextColor3 = Color3.fromRGB(255, 255, 255)
wmText.TextTransparency = 0.15
wmText.Size = UDim2.new(1, -16, 1, 0)
wmText.Position = UDim2.new(0, 8, 0, 0)
wmText.TextXAlignment = Enum.TextXAlignment.Left
wmText.BackgroundTransparency = 1
wmText.ZIndex = 999
wmText.Parent = wm

local wmAcc, wmFrames, wmFps = 0, 0, 0
addConnection(RunService.RenderStepped:Connect(function(dt)
    wmAcc = wmAcc + dt
    wmFrames = wmFrames + 1
    if wmAcc >= 0.5 then
        wmFps = math.floor(wmFrames / wmAcc + 0.5)
        wmAcc = 0
        wmFrames = 0
    end
    local ping = 0
    pcall(function()
        ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
    end)
    wmText.Text = string.format("hamer  |  %d fps  |  %d ms  |  %s", wmFps, ping, State.CurrentTheme)
    wmGui.Enabled = State.WatermarkEnabled
    if State.AimBotEnabled then
        aimCircle.Visible = true
        local d = State.AimBotFOV * 2
        aimCircle.Size = UDim2.new(0, d, 0, d)
    else
        aimCircle.Visible = false
    end
end))

local menuBtn = Instance.new("TextButton")
menuBtn.Size = UDim2.new(0, 44, 0, 44)
menuBtn.Position = UDim2.new(1, -58, 0, 12)
menuBtn.Text = "H"
menuBtn.Font = FONT_BLACK
menuBtn.TextSize = 20
menuBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
menuBtn.AutoButtonColor = false
menuBtn.ZIndex = 997
menuBtn.Parent = screenGui
glassify(menuBtn, 12, true)
bindTheme(function(c) menuBtn.TextColor3 = c end)

local function setMenu(open)
    State.MenuOpen = open
    menuBtn.Visible = not open
    if open then
        if settingsWin then settingsWin:Destroy(); settingsWin = nil end
        UI.main.Visible = true
        UI.main.Size = UDim2.new(0, 0, 0, 0)
        UI.main.Position = UDim2.new(0.5, 0, 0.5, 0)
        tween(UI.main, 0.42, {Size = UDim2.new(0, 760, 0, 500), Position = UDim2.new(0.5, -380, 0.5, -250)}, Enum.EasingStyle.Back)
        tween(blur, 0.4, {Size = 18})
        dim.Visible = true
        dim.ZIndex = 5
        dim.BackgroundTransparency = 1
        tween(dim, 0.4, {BackgroundTransparency = 0.5})
        playSound(SFX.Open)
    else
        if settingsWin then settingsWin:Destroy(); settingsWin = nil end
        tween(UI.main, 0.26, {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0)}, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
        tween(blur, 0.26, {Size = 0})
        tween(dim, 0.26, {BackgroundTransparency = 1})
        playSound(SFX.Close)
        task.delay(0.3, function()
            if not State.MenuOpen then
                UI.main.Visible = false
                dim.Visible = false
            end
        end)
    end
end

closeBtn.MouseButton1Click:Connect(function()
    setMenu(false)
end)

menuBtn.MouseButton1Click:Connect(function()
    setMenu(true)
end)

addConnection(UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.RightShift then
        setMenu(not State.MenuOpen)
    end
end))

local dragging, dragStart, startPos = false, nil, nil
header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = UI.main.Position
    end
end)
addConnection(UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local d = input.Position - dragStart
        UI.main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
    end
end))
addConnection(UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end))

addConnection(player.CharacterAdded:Connect(function()
    task.wait(1)
    applyKorblox(State.KorbloxEnabled)
    applyGhostLegs(State.GhostLegsEnabled)
    if State.WingsEnabled then applyWings() end
    if State.ChinaHatEnabled then applyChinaHat() end
    if State.KaguneEnabled then applyKagune() end
    if State.CompanionEnabled then applyCompanion() end
    if State.HaloEnabled then applyHalo() end
    if State.DongEnabled then applyDong() end
    setAvatarScale(State.AvatarScale)
end))

task.spawn(function()
    task.wait(0.4)
    if State.ESPEnabled then applyESP() end
end)

task.delay(0.8, function()
    if not State.MenuOpen then setMenu(true) end
end)

print("hamer client loaded — RSHIFT or H button")
