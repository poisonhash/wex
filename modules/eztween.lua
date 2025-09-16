--// Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

--// Player
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")

local ez = {}
local currenttween;

function ez:tweento(basepos, xoffset: number, yoffset: number, zoffset: number, speed: number)
    if basepos then
        if currenttween then
            currenttween:Cancel()
        end

        local targetpos = basepos + Vector3.new(xoffset, yoffset, zoffset)
        local dist = (root.Position - targetpos).Magnitude
        local duration = dist / speed

        local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear)
        currenttween = TweenService:Create(root, tweenInfo, {
            CFrame = CFrame.new(targetpos, targetpos + root.CFrame.LookVector)
        })
        currenttween:Play()
        return currenttween
    end
end

function ez:stoptween()
    if currenttween then
        currenttween:Cancel()
        currenttween = nil
    end
end

return ez
