local PaimonSection = CreateRegion(Paimon, "Paimon Helper") do
    local originalCalculateFireDirection = Modules.Name["RangedWeaponHandler"].calculateFireDirection

    local lastShotFiredTick = 0
    local isShotBeingTracked = false
    local shotTargetPlayer = nil
    local recentlyHitPlayers = {}

    local baseFolder = "$urge"
    local assetFolder = baseFolder .. "/assets"
    local imageSheetPath = assetFolder .. "/paimon.png"
    local totalFrames = 53
    local columns = 5
    local frameSize = Vector2.new(128, 128)
    local displaySize = Vector2.new(210, 210)

    if not isfolder(baseFolder) then makefolder(baseFolder) end
    if not isfolder(assetFolder) then makefolder(assetFolder) end

    local paimonGui = Instance.new("ScreenGui")
    paimonGui.Name = "helperui"
    paimonGui.ResetOnSpawn = false
    paimonGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local paimonImage = Instance.new("ImageLabel")
    paimonImage.Name = "sprite"
    paimonImage.BackgroundTransparency = 1
    paimonImage.Size = UDim2.new(0, displaySize.X, 0, displaySize.Y)
    paimonImage.Position = UDim2.new(0.5, 150, 0.5, 100)
    paimonImage.ZIndex = 5
    paimonImage.Image = getcustomasset(imageSheetPath)
    paimonImage.ImageTransparency = 0
    paimonImage.ImageRectSize = frameSize
    paimonImage.Parent = paimonGui

    local paimonText = Instance.new("TextLabel")
    paimonText.Name = "PaimonText"
    paimonText.BackgroundTransparency = 1
    paimonText.TextColor3 = Color3.new(1, 1, 1)
    paimonText.TextStrokeTransparency = 0.3
    paimonText.TextStrokeColor3 = Color3.new(0, 0, 0)
    paimonText.Font = Enum.Font.GothamBold 
    paimonText.TextScaled = true
    paimonText.Size = UDim2.new(0, 280, 0, 50)
    paimonText.Position = UDim2.new(0.5, 150, 0.5, -50)
    paimonText.ZIndex = 6
    paimonText.Text = ""
    paimonText.Visible = false
    paimonText.RichText = true

    local paimonSpeechBubble = Instance.new("Frame")
    paimonSpeechBubble.Name = "SpeechBubble"
    paimonSpeechBubble.Size = UDim2.new(0, 300, 0, 70)
    paimonSpeechBubble.Position = UDim2.new(0.5, 140, 0.5, -70)
    paimonSpeechBubble.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    paimonSpeechBubble.BackgroundTransparency = 0.2
    paimonSpeechBubble.BorderSizePixel = 0
    paimonSpeechBubble.ZIndex = 5
    paimonSpeechBubble.Visible = false
    paimonSpeechBubble.Parent = paimonGui

    local speechBubbleCorner = Instance.new("UICorner")
    speechBubbleCorner.CornerRadius = UDim.new(0, 8)
    speechBubbleCorner.Parent = paimonSpeechBubble

    paimonText.Parent = paimonSpeechBubble
    paimonText.Size = UDim2.new(1, -20, 1, -20)
    paimonText.Position = UDim2.new(0, 10, 0, 10)
    paimonText.TextXAlignment = Enum.TextXAlignment.Center
    paimonText.TextYAlignment = Enum.TextYAlignment.Center

    local killScreamSound = Instance.new("Sound")
    killScreamSound.Name = "KillScreamSound"
    killScreamSound.Volume = 0.5

    local function setupPaimonGui()
        local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
        if paimonGui.Parent ~= playerGui then
            paimonGui.Parent = playerGui
        end
    end

    setupPaimonGui()
    Players.LocalPlayer.CharacterAdded:Connect(setupPaimonGui)
    Players.LocalPlayer.PlayerGui.ChildAdded:Connect(function(child)
        if child.Name == "PlayerGui" and child:IsA("ScreenGui") and child ~= Players.LocalPlayer.PlayerGui then
            setupPaimonGui()
        end
    end)


    local playing = false
    local animationSpeed = 0.02

    task.spawn(function()
        while true do
            if playing then
                for i = 0, totalFrames - 1 do
                    if not playing then break end
                    local x = (i % columns) * frameSize.X
                    local y = math.floor(i / columns) * frameSize.Y
                    paimonImage.ImageRectOffset = Vector2.new(x, y)
                    task.wait(animationSpeed)
                end
            else
                task.wait(0.2)
            end
        end
    end)

    local paimonSpeechTimer = nil
    paimonSay = function(message, duration, killedPlayerDisplayName)
        if not Classes.EnablePaimonHelper.Value then
            return
        end
        if not Classes.EnablePaimonSpeech.Value then
            return
        end
        
        duration = duration or 3

        local finalMessage = message
        if Classes.CustomKillMessage.Value ~= "" then
            finalMessage = Classes.CustomKillMessage.Value
            if killedPlayerDisplayName then
                local colorCode = "rgb(255,255,255)" 
                finalMessage = finalMessage:gsub("%[target%.Player%]", string.format("<font color=\"%s\">%s</font>", colorCode, killedPlayerDisplayName))
            end
        end

        paimonText.Text = finalMessage
        paimonSpeechBubble.Visible = true
        paimonText.Visible = true

        if paimonSpeechTimer then
            task.cancel(paimonSpeechTimer)
        end

        paimonSpeechTimer = task.delay(duration, function()
            paimonSpeechBubble.Visible = false
            paimonText.Visible = false
        end)
    end

    Create(PaimonSection, "Checkbox", {
        Label = "Enable PaimonHelper",
        Value = false,
        Callback = function(_, isEnabled)
            paimonGui.Enabled = isEnabled
            playing = isEnabled
            if not isEnabled then
                if paimonSpeechTimer then
                    task.cancel(paimonSpeechTimer)
                end
                paimonSpeechBubble.Visible = false
                paimonText.Visible = false
            end
        end
    }, "EnablePaimonHelper", "Enables PaimonHelper 🥭")

    Create(PaimonSection, "SliderProgress", {
        Label = "Animation Speed",
        Value = 0.02,
        Minimum = 0.01,
        Maximum = 0.2,
        Format = "%.2f s/frame",
        Callback = function(_, value)
            animationSpeed = value
        end
    }, "PaimonAnimationSpeed", "Adjusts the Paimon animation speed")

    Create(PaimonSection, "SliderProgress", {
        Label = "Position X",
        Value = 150,
        Minimum = -500,
        Maximum = 500,
        Format = "%.f px",
        Callback = function(_, value)
            paimonImage.Position = UDim2.new(0.5, value, paimonImage.Position.Y.Scale, paimonImage.Position.Y.Offset)
            paimonSpeechBubble.Position = UDim2.new(0.5, value - 10, paimonSpeechBubble.Position.Y.Scale, paimonSpeechBubble.Position.Y.Offset)
        end
    }, "PaimonPosX", "Adjusts Paimon's X position")

    Create(PaimonSection, "SliderProgress", {
        Label = "Position Y",
        Value = 100,
        Minimum = -500,
        Maximum = 500,
        Format = "%.f px",
        Callback = function(_, value)
            paimonImage.Position = UDim2.new(paimonImage.Position.X.Scale, paimonImage.Position.X.Offset, 0.5, value)
            paimonSpeechBubble.Position = UDim2.new(paimonSpeechBubble.Position.X.Scale, paimonSpeechBubble.Position.X.Offset, 0.5, value - 150)
        end
    }, "PaimonPosY", "Adjusts Paimon's Y position")

    Create(PaimonSection, "SliderProgress", {
        Label = "Size",
        Value = 210,
        Minimum = 50,
        Maximum = 400,
        Format = "%.f px",
        Callback = function(_, value)
            paimonImage.Size = UDim2.new(0, value, 0, value)
        end
    }, "PaimonSize", "Adjusts Paimon's overall size")

    Create(PaimonSection, "Checkbox", {
        Label = "Enable Paimon Speech",
        Value = true,
        Callback = function(_, isEnabled)
            if not isEnabled then
                if paimonSpeechTimer then
                    task.cancel(paimonSpeechTimer)
                end
                paimonSpeechBubble.Visible = false
                paimonText.Visible = false
            end
        end
    }, "EnablePaimonSpeech", "Allows Paimon to talk and give you feedback.")

    local availableFonts = {
        {"SourceSans", Enum.Font.SourceSans},
        {"Roboto", Enum.Font.Roboto},
        {"RobotoMono", Enum.Font.RobotoMono},
        {"Arcade", Enum.Font.Arcade},
        {"Legacy", Enum.Font.Legacy}
    }
    local filteredFonts = {}
    local filteredFontNames = {}
    for _, fontData in ipairs(availableFonts) do
        local success, result = pcall(function() return fontData[2] end)
        if success and result and tostring(result) ~= "Enum.Font.Unknown" then
            table.insert(filteredFonts, fontData)
            table.insert(filteredFontNames, fontData[1])
        end
    end

    Create(PaimonSection, "Combo", {
        Label = "Paimon Font",
        Selected = 1,
        Items = filteredFontNames,
        Callback = function(_, value)
            for _, fontData in ipairs(filteredFonts) do
                if fontData[1] == value then
                    paimonText.Font = fontData[2]
                    break
                end
            end
        end
    }, "PaimonFont", "Changes the font of Paimon's speech.")

    Create(PaimonSection, "InputText", {
        Label = "Custom Kill Message",
        Placeholder = "Leave empty for default. Use [target.Player] for name.",
        Value = "",
    }, "CustomKillMessage", "Set a custom message for kill announcements.")

    Create(PaimonSection, "Checkbox", {
        Label = "Enable Scream on Kill",
        Value = false,
    }, "EnableScreamOnKill", "Plays a custom sound when you get an elimination.")

    paimonImage.Position = UDim2.new(0.5, Classes.PaimonPosX.Value, 0.5, Classes.PaimonPosY.Value)
    paimonImage.Size = UDim2.new(0, Classes.PaimonSize.Value, 0, Classes.PaimonSize.Value)
    paimonSpeechBubble.Position = UDim2.new(0.5, Classes.PaimonPosX.Value - 10, 0.5, Classes.PaimonPosY.Value - 150)

    local function connectPlayerDiedListeners(player)
        local character = player.Character or player.CharacterAdded:Wait()
        if character then
            local humanoid = character:WaitForChild("Humanoid", 5)
            if humanoid then
                humanoid.Died:Connect(function()
                    if Classes.EnablePaimonHelper.Value then
                        local lastHitTick = recentlyHitPlayers[player.UserId]
                        if lastHitTick and (tick() - lastHitTick < 2) then
                            paimonSay(`Yay! You eliminated {player.DisplayName}! One less enemy to worry about!`, 5, player.DisplayName)
                            
                            if Classes.EnableScreamOnKill.Value then
                                killScreamSound.SoundId = "rbxassetid://YOUR_AUDIO_ID_HERE"
                                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                    killScreamSound.Parent = LocalPlayer.Character.HumanoidRootPart
                                    killScreamSound:Play()
                                end
                            end

                            recentlyHitPlayers[player.UserId] = nil
                        end
                    end
                end)
            end
        end
    end

    for _, player in Players:GetPlayers() do
        connectPlayerDiedListeners(player)
        player.CharacterAdded:Connect(function(char)
            task.spawn(function() connectPlayerDiedListeners(player) end)
        end)
    end

    Players.PlayerAdded:Connect(function(player)
        player.CharacterAdded:Connect(function(char)
            task.spawn(function() connectPlayerDiedListeners(player) end)
        end)
        if player.Character then
            task.spawn(function() connectPlayerDiedListeners(player) end)
        end
    end)

    Framework:AddHook("MeleeDamage", function(originalFireServer, self, name, ...)
        local args = {...}
        if Classes.EnablePaimonHelper.Value then
            local hitPart = args[2]
            local targetChar = hitPart and hitPart.Parent
            if targetChar and targetChar:IsA("Model") and Players:GetPlayerFromCharacter(targetChar) then
                local targetPlayer = Players:GetPlayerFromCharacter(targetChar)
                paimonSay(`You hit {targetPlayer.DisplayName} with your melee! Nice one!`, 3, targetPlayer.DisplayName)
                recentlyHitPlayers[targetPlayer.UserId] = tick()
            end
        end
        return originalFireServer(self, name, unpack(args))
    end)

    Framework:AddHook("RangedHit", function(originalFireServer, self, name, ...)
        local args = {...}
        if Classes.EnablePaimonHelper.Value then
            local hitPart = args[2]
            local targetChar = hitPart and hitPart.Parent
            if targetChar and targetChar:IsA("Model") and Players:GetPlayerFromCharacter(targetChar) then
                local targetPlayer = Players:GetPlayerFromCharacter(targetChar)
                paimonSay(`You landed a ranged hit on {targetPlayer.DisplayName}'s {hitPart.Name}!`, 3, targetPlayer.DisplayName)
                recentlyHitPlayers[targetPlayer.UserId] = tick()
                isShotBeingTracked = false
                shotTargetPlayer = nil
            end
        end
        return originalFireServer(self, name, unpack(args))
    end)

    Framework:AddHook("RangedFire", function(originalFireServer, self, name, ...)
        local args = {...}
        if Classes.EnablePaimonHelper.Value then
            lastShotFiredTick = tick()
            isShotBeingTracked = true
        end
        return originalFireServer(self, name, unpack(args))
    end)

    Modules.Name["RangedWeaponHandler"].calculateFireDirection = function(...)
        local args = {...}
        local originalResult = originalCalculateFireDirection(unpack(args))

        if Classes.EnablePaimonHelper.Value then
            if Classes.SilentAim.Value then
                local target = Framework:GetClosestToMouse(Classes.FOVSize.Value)
                if target and not Framework:InMenu(target) then
                    paimonSay(`Targeting {target.DisplayName}! Hit Chance is {Classes.HitChance.Value}%. Looking good!`, 3, target.DisplayName)
                    shotTargetPlayer = target
                    
                    if Classes.Resolver.Value then
                        local ranged, metadata = Framework:GetRanged()
                        if ranged and metadata then
                            local hitPart = target.Character:FindFirstChild(Classes.SilentHitPart.Value)
                            if hitPart then
                                local cheatedOrigin = metadata:getCheatedBackOriginIfInObject(metadata._mainCasterBehavior.RaycastParams)
                                local projectileSpeed = metadata._itemConfig.speed or 200
                                local projectileGravity = Vector3.new(0, 0, 0)
                                
                                local predictedPos = PredictTargetPosition(cheatedOrigin, {Position = hitPart.Position, Velocity = (Classes.Resolver.Value and target.Character:FindFirstChildOfClass("Humanoid").MoveDirection or hitPart.Velocity)}, projectileSpeed, LocalPlayer:GetNetworkPing() * 1000, projectileGravity.Y)
                                
                                local actualAimDirection = (hitPart.Position - cheatedOrigin).Unit
                                local predictedAimDirection = (predictedPos - cheatedOrigin).Unit

                                local angleDiff = math.deg(math.acos(math.clamp(actualAimDirection:Dot(predictedAimDirection), -1, 1)))
                                if angleDiff > 0.5 then
                                    paimonSay(`Resolver active! Adjusted aim by {math.round(angleDiff * 100) / 100} degrees for {target.DisplayName}.`, 4, target.DisplayName)
                                end
                            end
                        end
                    end
                end
            end
        end
        return originalResult
    end

    Framework:BindToRenderStep(function()
        if Classes.EnablePaimonHelper.Value and isShotBeingTracked then
            if tick() - lastShotFiredTick > 0.75 then
                paimonSay(`Aww, you missed {shotTargetPlayer.DisplayName}! My tracking device must be broken...`, 4, shotTargetPlayer.DisplayName)
                isShotBeingTracked = false
                shotTargetPlayer = nil
            end
        end
    end)

    paimonImage.Position = UDim2.new(0.5, Classes.PaimonPosX.Value, 0.5, Classes.PaimonPosY.Value)
    paimonImage.Size = UDim2.new(0, Classes.PaimonSize.Value, 0, Classes.PaimonSize.Value)
    paimonSpeechBubble.Position = UDim2.new(0.5, Classes.PaimonPosX.Value - 10, 0.5, Classes.PaimonPosY.Value - 150)
    
end
