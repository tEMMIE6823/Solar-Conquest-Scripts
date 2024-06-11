loadstring(game:HttpGet("https://raw.githubusercontent.com/tEMMIE6823/Scripts/main/IY-Wave-Edit.lua"))()
local UserInputService = game:GetService("UserInputService")

local player = game.Players.LocalPlayer
local CAS = game:GetService("ContextActionService")
local character = player.Character or player.CharacterAdded:Wait()
local function find()
    local nearestItem = nil
    local nearestDistance = math.huge
    local charPosition = character.PrimaryPart.Position
    local resources = game.Workspace:FindFirstChild("Resources")
    if resources then
        for _, item in pairs(resources:GetDescendants()) do
            if item:IsA("Part") then
                local distance = (charPosition - item.Position).magnitude
                if distance < nearestDistance then
                    nearestDistance = distance
                    nearestItem = item
                end
            end
        end
    end

    return nearestItem
end

local function teleportZX()
    local nearestItem = findNearestItem()
    local character = player.Character or player.CharacterAdded:Wait()

    if nearestItem then
        local behindPosition = nearestItem.Position - nearestItem.CFrame.LookVector * 5
        character:SetPrimaryPartCFrame(CFrame.new(behindPosition + Vector3.new(0, 3, 0)))
        print("Teleported to " .. nearestItem.Name)
    else
        warn("No items found")
    end
end


local function equipTool(toolName)
    local tool = player.Backpack:FindFirstChild(toolName)
    if tool then
        tool.Parent = character
    else
    end
end

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent then
        return
    end

    if input.KeyCode == Enum.KeyCode.Z then
        teleportToNearestItem()
    end
end)
local function CF(actionName, inputState, inputObject)
    if inputState == Enum.UserInputState.Begin then
            print("mouse cframe teleport")
            local cfr = player:GetMouse().Hit
            player.Character:SetPrimaryPartCFrame(cfr * CFrame.new(0, 2, 0))
        end
    end


CAS:BindActionAtPriority(
    "CF",
    CF,
    false,
    Enum.ContextActionPriority.Low.Value,
    Enum.KeyCode.X
)
loadstring(game:HttpGet("https://raw.githubusercontent.com/tEMMIE6823/Scripts/main/IY-Wave-Edit.lua"))()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local function equipTool(toolName)
    local tool = player.Backpack:FindFirstChild(toolName)
    if tool then
        tool.Parent = character
    else
    end
end

local Resources = game.Workspace:FindFirstChild("Resources")
if not Resources then
    print("Resources folder not found. Maybe incorrect map?")
    return
end

while true do
    local foundUnanchored = false
    for _, model in ipairs(Resources:GetChildren()) do
        if model:IsA("Model") then
            for _, item in ipairs(model:GetChildren()) do
                if item:IsA("Part") and not item.Anchored then
                    print("Deleting unanchored part:", item.Name)
                    item:Destroy()
                    foundUnanchored = true
                end
            end
        end
    end

    if not foundUnanchored then
        print("my badonker hurtie :(")
    end
    wait(1) 
end

-- im not optimising it, i think its funny how it is
