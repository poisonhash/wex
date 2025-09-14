--// Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

--// Player
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")

local ez = {}

function ez:tweento(basepos: Vector3, xoffset: number, yoffset: number, zoffset: number, speed: number)
    if basePos then
        local targetpos = basepos + Vector3.new(xoffset, yoffset, zoffset)

        local dist = (root.Position - targetpos).Magnitude
        local duration = dist / speed

        local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear)
        local tween = TweenService:Create(root, tweenInfo, { CFrame = CFrame.new(targetpos, targetpos + root.CFrame.LookVector) })
        tween:Play()
        return tween
    end
end

return ez
