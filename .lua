local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Window = Library:CreateWindow({
    Title = "终极战场 1.5",
    Footer = "牟",
    Icon = 5252447904,
    NotifySide = "Right",
    ShowCustomCursor = true,
})

local Tabs = {
    Main = Window:AddTab('主'),
    ["UI Settings"] = Window:AddTab("Se", "settings"),
}
local Lol = Tabs.Main:AddLeftGroupbox('主要')
Lol:AddLabel("这个脚本是免费的 如果你是购买的，那你就是被骗了")

local AC = {}
AC.AB = game:GetService("Players")
AC.ANAL = game:GetService("RunService")
AC.AO = AC.AB.LocalPlayer
AC.AP = AC.AO.Character or AC.AO.CharacterAdded:Wait()
AC.AQ = AC.AP:WaitForChild("HumanoidRootPart")
AC.AR = nil
AC.AS = false
AC.AT = 10  
AC.AU = Vector3.new(6, 10, 2)  
AC.AV = function()
    if AC.AR and AC.AR.Parent then AC.AR:Destroy()
    end
    AC.AR = Instance.new("Part")
    AC.AR.Name = "GGBO"
    AC.AR.Size = AC.AU
    AC.AR.Anchored = true
    AC.AR.CanCollide = true
    AC.AR.Color = Color3.fromRGB(100, 80, 60)
    AC.AR.Material = Enum.Material.Slate
    AC.AR.Transparency = 0.2      
    local AW = Instance.new("Texture")
    AW.Texture = "rbxassetid://7129155278"
    AW.Face = Enum.NormalId.Top
    AW.StudsPerTileU = 2
    AW.StudsPerTileV = 2
    AW.Parent = AC.AR    
    AC.AR.Parent = workspace
end
AC.AX = function()
    if not AC.AR or not AC.AR.Parent or not AC.AQ then return end
    local AY = AC.AQ.CFrame.LookVector
    local AZ = AC.AQ.Position + (AY * AC.AT)
    local BA = AC.AU.Y / 2
    local BB = Vector3.new(AZ.X, AC.AQ.Position.Y, AZ.Z)
    local BC = CFrame.new(BB) * CFrame.fromEulerAnglesYXZ(0, math.atan2(-AY.X, -AY.Z), 0)
    AC.AR.CFrame = BC
end
AC.BD = function()
    AC.AS = true
    AC.AV()    
    if AC.BE then AC.BE:Disconnect()
    end  
    AC.BE = AC.ANAL.Heartbeat:Connect(function()
        if AC.AS and AC.AR then AC.AX()
        end
    end)
end
AC.BF = function()
    AC.AS = false
    if AC.BE then AC.BE:Disconnect() AC.BE = nil
    end    
    if AC.AR then AC.AR:Destroy() AC.AR = nil
    end
end
AC.AO.CharacterAdded:Connect(function(BG)
    AC.AP = BG
    AC.AQ = AC.AP:WaitForChild("HumanoidRootPart")
    
    if AC.AS then AC.AV()
    end
end)

Lol:AddToggle('WallToggle', {
    Text = '撞墙',
    Default = false,
    Tooltip = 'i',
    Callback = function(v)
        if v then AC.BD()
        else
            AC.BF()
        end
    end,
})

le:GetService("RunService")
local remoteEvent = replicatedStorage:WaitForChild("Remotes"):WaitForChild("Combat"):WaitForChild("Block")
local args = { true }
local RN = false
local LC = nil
Lol:AddToggle('MyToggle', {
	Text = '伪 防(几乎上帝模式)',
	Default = false,
	Tooltip = 'WTF',
	Callback = function(v)
		if v then
			RN = true
			LC = RunService.Heartbeat:Connect(function()
				remoteEvent:FireServer(unpack(args))
			end)
		else
			RN = false
			if LC then
				LC:Disconnect()
				LC = nil
			end
		end
	end,
})
Lol:AddToggle('MyToggle', {
	Text = '开启速度',
	Default = false, 
	Tooltip = '..', 

	Callback = function(v)
if v == true then
                sudu = game:GetService("RunService").Heartbeat:Connect(function()
                    if game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character.Humanoid and game:GetService("Players").LocalPlayer.Character.Humanoid.Parent then
                        if game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
                            game:GetService("Players").LocalPlayer.Character:TranslateBy(game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection * Speed / 20)
                        end
                    end
                end)
            elseif not v and sudu then
                sudu:Disconnect()
                sudu = nil
            end
	end
})
Lol:AddSlider('MySlider', {
	Text = '速度',
	Default = 0,
	Min = 0.1,
	Max = 50,
	Rounding = 0,
	Compact = false,

	Callback = function(v)
		Speed = v
	end
})

Lol:AddToggle('MyToggle', {
	Text = '穿墙',
	Default = false, 
	Tooltip = '..', 
	Callback = function(state)
       local player = game.Players.LocalPlayer
        local char = player.Character
        local runService = game:GetService("RunService")
        if state then
            _G.NoClip = runService.Stepped:Connect(function()
                for _, v in pairs(char:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end)
        else
            if _G.NoClip then
                _G.NoClip:Disconnect()
                _G.NoClip = nil
            end
            for _, v in pairs(char:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = true
                end
            end
        end
        end
})

Lol:AddToggle('MyToggle', {
	Text = '高亮',
	Default = false, 
	Tooltip = '..', 
	Callback = function(Light)
spawn(function() while task.wait() do 
if Light then
 game.Lighting.Ambient = Color3.new(1, 1, 1) 
 else
  game.Lighting.Ambient = Color3.new(0, 0, 0) 
  end 
  end 
  end)
  end
})

local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("一些调试")

MenuGroup:AddToggle("KeybindMenuOpen", {
	Default = Library.KeybindFrame.Visible,
	Text = "快捷菜单",
	Callback = function(value)
		Library.KeybindFrame.Visible = value
	end,
})
MenuGroup:AddToggle("ShowCustomCursor", {
	Text = "自定义光标",
	Default = true,
	Callback = function(Value)
		Library.ShowCustomCursor = Value
	end,
})
MenuGroup:AddDropdown("NotificationSide", {
	Values = { "左", "右" },
	Default = "右",
	Text = "通知位置",
	Callback = function(Value)
		Library:SetNotifySide(Value)
	end,
})
MenuGroup:AddDropdown("DPIDropdown", {
	Values = { "25%", "50%", "75%", "100%", "125%", "150%", "175%", "200%" },
	Default = "100%",
	Text = "UI大小",
	Callback = function(Value)
		Value = Value:gsub("%%", "")
		local DPI = tonumber(Value)

		Library:SetDPIScale(DPI)
	end,
})
MenuGroup:AddDivider()
MenuGroup:AddLabel("Menu bind")
	:AddKeyPicker("MenuKeybind", { Default = "RightShift", NoUI = true, Text = "Menu keybind" })
MenuGroup:AddButton("删除ui", function()
	Library:Unload()
end)
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })
ThemeManager:SetFolder("MyScriptHub")
SaveManager:SetFolder("MyScriptHub/specific-game")
SaveManager:SetSubFolder("specific-place") 
SaveManager:BuildConfigSection(Tabs["UI Settings"])
ThemeManager:ApplyToTab(Tabs["UI Settings"])
SaveManager:LoadAutoloadConfig()

local PlayerList = {}
local SelectPlayer = ""
for i,v in pairs(game.Players:GetPlayer())
    if v ~= game.Players.LocalPlayer then
        PlayerList[i] = v.Name
    end
end

MenuGroup:AddDropdown("PlayersList", {
	Values = PlayerList
	Default = "",
	Text = "选择玩家",
	Callback = function(Value)
		SelectPlayer = Value
	end,
})

MenuGroup:AddButton("传送选择玩家",, function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[SelectPlayer].Character.HumanoidRootPart.CFrame
end)

MenuGroup:AddToggle("AutoTeleport", {
	Text = "循环传送选择玩家",
	Default = true,
	Callback = function(Value)
	    while Value and wait() do
		    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[SelectPlayer].Character.HumanoidRootPart.CFrame
		end,
	end,
})

MenuGroup:AddToggle("Subject", {
	Text = "查看选择玩家",
	Default = true,
	Callback = function(Value)
	    if Value then
	        workspace.CurrentCamera.CameraSubject = game.Players[SelectPlayer].Character.Humanoid 
	    else
		    workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
		end,
	end,
})

MenuGroup:AddButton("甩飞一次", function()
    if SelectPlayer == nil then 
    elseif SelectPlayer ~= nil then
    local Targets = {SelectPlayer}
    
    local Players = game:GetService("Players")
    local Player = Players.LocalPlayer
    
    local AllBool = false
    
    local GetPlayer = function(Name)
        Name = Name:lower()
        if Name == "all" or Name == "others" then
            AllBool = true
            return
        elseif Name == "random" then
            local GetPlayers = Players:GetPlayers()
            if table.find(GetPlayers,Player) then table.remove(GetPlayers,table.find(GetPlayers,Player)) end
            return GetPlayers[math.random(#GetPlayers)]
        elseif Name ~= "random" and Name ~= "all" and Name ~= "others" then
            for _,x in next, Players:GetPlayers() do
                if x ~= Player then
                    if x.Name:lower():match("^"..Name) then
                        return x;
                    elseif x.DisplayName:lower():match("^"..Name) then
                        return x;
                    end
                end
            end
        else
            return
        end
    end
    
    local Message = function(_Title, _Text, Time)
        game:GetService("StarterGui"):SetCore("SendNotification", {Title = _Title, Text = _Text, Duration = Time})
    end
    
    local SkidFling = function(TargetPlayer)
        local Character = Player.Character
        local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
        local RootPart = Humanoid and Humanoid.RootPart
    
        local TCharacter = TargetPlayer.Character
        local THumanoid
        local TRootPart
        local THead
        local Accessory
        local Handle
    
        if TCharacter:FindFirstChildOfClass("Humanoid") then
            THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
        end
        if THumanoid and THumanoid.RootPart then
            TRootPart = THumanoid.RootPart
        end
        if TCharacter:FindFirstChild("Head") then
            THead = TCharacter.Head
        end
        if TCharacter:FindFirstChildOfClass("Accessory") then
            Accessory = TCharacter:FindFirstChildOfClass("Accessory")
        end
        if Accessoy and Accessory:FindFirstChild("Handle") then
            Handle = Accessory.Handle
        end
    
        if Character and Humanoid and RootPart then
            if RootPart.Velocity.Magnitude < 50 then
                getgenv().OldPos = RootPart.CFrame
            end
            if THumanoid and THumanoid.Sit and not AllBool then
                return Message("玩家消失", "已停止", 5)
            end
            if THead then
                workspace.CurrentCamera.CameraSubject = THead
            elseif not THead and Handle then
                workspace.CurrentCamera.CameraSubject = Handle
            elseif THumanoid and TRootPart then
                workspace.CurrentCamera.CameraSubject = THumanoid
            end
            if not TCharacter:FindFirstChildWhichIsA("BasePart") then
                return
            end
    
            local FPos = function(BasePart, Pos, Ang)
                RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
                Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
                RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
                RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
            end
    
            local SFBasePart = function(BasePart)
                local TimeToWait = 2
                local Time = tick()
                local Angle = 0
    
                repeat
                    if RootPart and THumanoid then
                        if BasePart.Velocity.Magnitude < 50 then
                            Angle = Angle + 100
    
                            FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle),0 ,0))
                            task.wait()
    
                            FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                            task.wait()
    
                            FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                            task.wait()
    
                            FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                            task.wait()
    
                            FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                            task.wait()
    
                            FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                            task.wait()
                        else
                            FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()
    
                            FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
                            task.wait()
    
                            FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()
    
                            FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()
    
                            FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
                            task.wait()
    
                            FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()
    
                            FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()
    
                            FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                            task.wait()
    
                            FPos(BasePart, CFrame.new(0, -1.5 ,0), CFrame.Angles(math.rad(-90), 0, 0))
                            task.wait()
    
                            FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                            task.wait()
                        end
                    else
                        break
                    end
                until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
            end
    
            workspace.FallenPartsDestroyHeight = 0/0
    
            local BV = Instance.new("BodyVelocity")
            BV.Name = "EpixVel"
            BV.Parent = RootPart
            BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
            BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)
    
            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
    
            if TRootPart and THead then
                if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
                    SFBasePart(THead)
                else
                    SFBasePart(TRootPart)
                end
            elseif TRootPart and not THead then
                SFBasePart(TRootPart)
            elseif not TRootPart and THead then
                SFBasePart(THead)
            elseif not TRootPart and not THead and Accessory and Handle then
                SFBasePart(Handle)
            else
                return Message("皮脚本", "已开/关", 5)
            end
    
            BV:Destroy()
            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
            workspace.CurrentCamera.CameraSubject = Humanoid
    
            repeat
                RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
                Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
                Humanoid:ChangeState("GettingUp")
                table.foreach(Character:GetChildren(), function(_, x)
                    if x:IsA("BasePart") then
                        x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
                    end
                end)
                task.wait()
            until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25
            workspace.FallenPartsDestroyHeight = getgenv().FPDH
        else
            return Message("玩家消失", "已停止", 5)
        end
    end
    
    if Targets[1] then for _,x in next, Targets do GetPlayer(x) end else return end
    
    if AllBool then
        for _,x in next, Players:GetPlayers() do
            SkidFling(x)
        end
    end
    
    for _,x in next, Targets do
        if GetPlayer(x) and GetPlayer(x) ~= Player then
            if GetPlayer(x).UserId ~= 1414978355 then
                local TPlayer = GetPlayer(x)
                if TPlayer then
                    SkidFling(TPlayer)
                end
            else
                Message("检测到玩家消失", "己停止", 5)
            end
        elseif not GetPlayer(x) and not AllBool then
            Message("未获取到玩家或工具", "已停止", 5)
        end
    end
    end
	end,
})

MenuGroup:AddToggle("AutoTeleport", {
	Text = "循环传送选择玩家",
	Default = true,
	Callback = function(t)
        if SelectPlayer == nil then
         elseif SelectPlayer ~= nil then
        getgenv().autofling = t
        spawn(function()
        while autofling do wait()
        pcall(function()
        local Targets = {SelectPlayer}
        
        local Players = game:GetService("Players")
        local Player = Players.LocalPlayer
        
        local AllBool = false
        
        local GetPlayer = function(Name)
            Name = Name:lower()
            if Name == "all" or Name == "others" then
                AllBool = true
                return
            elseif Name == "random" then
                local GetPlayers = Players:GetPlayers()
                if table.find(GetPlayers,Player) then table.remove(GetPlayers,table.find(GetPlayers,Player)) end
                return GetPlayers[math.random(#GetPlayers)]
            elseif Name ~= "random" and Name ~= "all" and Name ~= "others" then
                for _,x in next, Players:GetPlayers() do
                    if x ~= Player then
                        if x.Name:lower():match("^"..Name) then
                            return x;
                        elseif x.DisplayName:lower():match("^"..Name) then
                            return x;
                        end
                    end
                end
            else
                return
            end
        end
        
        local Message = function(_Title, _Text, Time)
            game:GetService("StarterGui"):SetCore("SendNotification", {Title = _Title, Text = _Text, Duration = Time})
        end
        
        local SkidFling = function(TargetPlayer)
            local Character = Player.Character
            local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
            local RootPart = Humanoid and Humanoid.RootPart
        
            local TCharacter = TargetPlayer.Character
            local THumanoid
            local TRootPart
            local THead
            local Accessory
            local Handle
        
            if TCharacter:FindFirstChildOfClass("Humanoid") then
                THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
            end
            if THumanoid and THumanoid.RootPart then
                TRootPart = THumanoid.RootPart
            end
            if TCharacter:FindFirstChild("Head") then
                THead = TCharacter.Head
            end
            if TCharacter:FindFirstChildOfClass("Accessory") then
                Accessory = TCharacter:FindFirstChildOfClass("Accessory")
            end
            if Accessoy and Accessory:FindFirstChild("Handle") then
                Handle = Accessory.Handle
            end
        
            if Character and Humanoid and RootPart then
                if RootPart.Velocity.Magnitude < 50 then
                    getgenv().OldPos = RootPart.CFrame
                end
                if THumanoid and THumanoid.Sit and not AllBool then
                    return Message("皮脚本", "错误❌", 5)
                end
                if THead then
                    workspace.CurrentCamera.CameraSubject = THead
                elseif not THead and Handle then
                    workspace.CurrentCamera.CameraSubject = Handle
                elseif THumanoid and TRootPart then
                    workspace.CurrentCamera.CameraSubject = THumanoid
                end
                if not TCharacter:FindFirstChildWhichIsA("BasePart") then
                    return
                end
        
                local FPos = function(BasePart, Pos, Ang)
                    RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
                    Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
                    RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
                    RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
                end
        
                local SFBasePart = function(BasePart)
                    local TimeToWait = 2
                    local Time = tick()
                    local Angle = 0
        
                    repeat
                        if RootPart and THumanoid then
                            if BasePart.Velocity.Magnitude < 50 then
                                Angle = Angle + 100
        
                                FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle),0 ,0))
                                task.wait()
        
                                FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                                task.wait()
        
                                FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                                task.wait()
        
                                FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                                task.wait()
        
                                FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                                task.wait()
        
                                FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                                task.wait()
                            else
                                FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                                task.wait()
        
                                FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
                                task.wait()
        
                                FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                                task.wait()
        
                                FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                                task.wait()
        
                                FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
                                task.wait()
        
                                FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                                task.wait()
        
                                FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                                task.wait()
        
                                FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                                task.wait()
        
                                FPos(BasePart, CFrame.new(0, -1.5 ,0), CFrame.Angles(math.rad(-90), 0, 0))
                                task.wait()
        
                                FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                                task.wait()
                            end
                        else
                            break
                        end
                    until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
                end
        
                workspace.FallenPartsDestroyHeight = 0/0
        
                local BV = Instance.new("BodyVelocity")
                BV.Name = "EpixVel"
                BV.Parent = RootPart
                BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
                BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)
        
                Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
        
                if TRootPart and THead then
                    if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
                        SFBasePart(THead)
                    else
                        SFBasePart(TRootPart)
                    end
                elseif TRootPart and not THead then
                    SFBasePart(TRootPart)
                elseif not TRootPart and THead then
                    SFBasePart(THead)
                elseif not TRootPart and not THead and Accessory and Handle then
                    SFBasePart(Handle)
                else
                    return Message("皮脚本", "已开/关", 5)
                end
        
                BV:Destroy()
                Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                workspace.CurrentCamera.CameraSubject = Humanoid
        
                repeat
                    RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
                    Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
                    Humanoid:ChangeState("GettingUp")
                    table.foreach(Character:GetChildren(), function(_, x)
                        if x:IsA("BasePart") then
                            x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
                        end
                    end)
                    task.wait()
                until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25
                workspace.FallenPartsDestroyHeight = getgenv().FPDH
            else
                return Message("玩家消失", "已停止", 5)
            end
        end
        
        if Targets[1] then for _,x in next, Targets do GetPlayer(x) end else return end
        
        if AllBool then
            for _,x in next, Players:GetPlayers() do
                SkidFling(x)
            end
        end
        
        for _,x in next, Targets do
            if GetPlayer(x) and GetPlayer(x) ~= Player then
                if GetPlayer(x).UserId ~= 1414978355 then
                    local TPlayer = GetPlayer(x)
                    if TPlayer then
                        SkidFling(TPlayer)
                    end
                else
                    Message("检测到玩家消失", "已停止", 5)
                end
            elseif not GetPlayer(x) and not AllBool then
                Message("未获取到玩家或工具", "已停止", 5)
            end
        end
        end)
        end
        end)
        end
	end,
})
