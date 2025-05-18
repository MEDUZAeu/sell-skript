-- === ЗАЩИТА ПО USERID ===
local allowedUsers = {
    [8473503624] = true,
    [1157633867] = true,
}

local plr = game:GetService("Players").LocalPlayer
if not allowedUsers[plr.UserId] then
    plr:Kick("Нет доступа к скрипту!\nОбратитесь к владельцу.")
    return
end

-- === ОСНОВНОЙ КОД ===
local Players = game:GetService("Players")
local player  = Players.LocalPlayer

local minPercent = 1.07
local maxPercent = 1.15

local allowedFruits = { grape=true, pepper=true, cacao=true, mango=true, mushroom=true }

local fruitPrices = {
    apple = 5, cactus = 12, ["candy blossom"] = 20, coconut = 8,
    ["dragon fruit"] = 30, ["easter egg"] = 15, grape = 7, mango = 10,
    peach = 9, pineapple = 14, ["blue berry"] = 25, pepper = 7,
}
local variantMultipliers = {
    Default=1, Golden=20, Gold=20, Rainbow=50, Wet=2, Chilled=2, Frozen=10,
    Shocked=100, Chocolate=2, Moonlit=2, Blood=4, Zombie=25,
    Celestial=120, Disco=125, Big=1,
}

--=== GUI DESIGN (В стиле "Session Information" и "Potions") ===--
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "AutoCollectGUI"
gui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame", gui)
mainFrame.AnchorPoint = Vector2.new(0.5,1)
mainFrame.Position = UDim2.new(0.5,0,0.93,0)
mainFrame.Size = UDim2.new(0.38,0,0.15,0)
mainFrame.BackgroundColor3 = Color3.fromRGB(100,85,190)
mainFrame.BackgroundTransparency = 0.18
mainFrame.BorderSizePixel = 0
mainFrame.ZIndex = 5
mainFrame.ClipsDescendants = true
mainFrame.Visible = true

local uicorner = Instance.new("UICorner", mainFrame)
uicorner.CornerRadius = UDim.new(0,22)

local shadow = Instance.new("ImageLabel", mainFrame)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://1316045217"
shadow.Size = UDim2.new(1,28,1,28)
shadow.Position = UDim2.new(0,-14,0,-14)
shadow.ImageColor3 = Color3.fromRGB(90,50,130)
shadow.ImageTransparency = 0.76
shadow.ZIndex = 4

local title = Instance.new("TextLabel", mainFrame)
title.Text = "🍍  Автосбор фруктов"
title.Font = Enum.Font.GothamBold
title.TextSize = 27
title.TextColor3 = Color3.fromRGB(215,225,255)
title.TextStrokeTransparency = 0.65
title.BackgroundTransparency = 1
title.Size = UDim2.new(1,0,0.22,0)
title.Position = UDim2.new(0,0,0.03,0)
title.ZIndex = 6

-- (Фон-подложка для красоты)
local bgBlur = Instance.new("Frame", mainFrame)
bgBlur.Size = UDim2.new(1, -20, 0.66, 0)
bgBlur.Position = UDim2.new(0, 10, 0.2, 0)
bgBlur.BackgroundColor3 = Color3.fromRGB(145,105,235)
bgBlur.BackgroundTransparency = 0.35
bgBlur.ZIndex = 5
local blurCorner = Instance.new("UICorner", bgBlur)
blurCorner.CornerRadius = UDim.new(0,18)

local amount = Instance.new("TextBox", mainFrame)
amount.Size = UDim2.new(0.47,0,0.2,0)
amount.Position = UDim2.new(0.03,0,0.26,0)
amount.Font = Enum.Font.GothamSemibold
amount.TextSize = 22
amount.PlaceholderText = "Сумма, например: 10М"
amount.TextColor3 = Color3.fromRGB(255,255,255)
amount.BackgroundColor3 = Color3.fromRGB(120,105,185)
amount.BackgroundTransparency = 0.05
amount.ClearTextOnFocus = false
amount.ZIndex = 6
local inputCorner = Instance.new("UICorner", amount)
inputCorner.CornerRadius = UDim.new(0,12)

local collectBtn = Instance.new("TextButton", mainFrame)
collectBtn.Size = UDim2.new(0.2,0,0.2,0)
collectBtn.Position = UDim2.new(0.52,7,0.26,0)
collectBtn.Font = Enum.Font.GothamBold
collectBtn.Text = "Собрать"
collectBtn.TextColor3 = Color3.fromRGB(255,255,255)
collectBtn.BackgroundColor3 = Color3.fromRGB(64,175,255)
collectBtn.TextSize = 20
collectBtn.AutoButtonColor = true
collectBtn.ZIndex = 6
local collectCorner = Instance.new("UICorner", collectBtn)
collectCorner.CornerRadius = UDim.new(0,12)

local returnBtn = Instance.new("TextButton", mainFrame)
returnBtn.Size = UDim2.new(0.2,0,0.2,0)
returnBtn.Position = UDim2.new(0.74,7,0.26,0)
returnBtn.Font = Enum.Font.GothamBold
returnBtn.Text = "Вернуть"
returnBtn.TextColor3 = Color3.fromRGB(255,255,255)
returnBtn.BackgroundColor3 = Color3.fromRGB(200,85,150)
returnBtn.TextSize = 20
returnBtn.ZIndex = 6
local returnCorner = Instance.new("UICorner", returnBtn)
returnCorner.CornerRadius = UDim.new(0,12)

local statusLabel = Instance.new("TextLabel", mainFrame)
statusLabel.Size = UDim2.new(1,-16,0.22,0)
statusLabel.Position = UDim2.new(0,8,0.57,0)
statusLabel.BackgroundTransparency = 1
statusLabel.TextColor3 = Color3.fromRGB(255,255,135)
statusLabel.TextStrokeTransparency = 0.85
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 19
statusLabel.Text = "Ожидание..."
statusLabel.ZIndex = 6
statusLabel.TextWrapped = true

local collectSumLabel = Instance.new("TextLabel", mainFrame)
collectSumLabel.Size = UDim2.new(1,-16,0.16,0)
collectSumLabel.Position = UDim2.new(0,8,0.81,0)
collectSumLabel.BackgroundTransparency = 1
collectSumLabel.TextColor3 = Color3.fromRGB(130,255,220)
collectSumLabel.TextStrokeTransparency = 0.7
collectSumLabel.Font = Enum.Font.GothamSemibold
collectSumLabel.TextSize = 16
collectSumLabel.Text = ""
collectSumLabel.ZIndex = 6
collectSumLabel.TextWrapped = true

--=== PRICE CALC ===--
local function formatNumber(num)
    local s = tostring(num)
    local parts = {}
    while #s > 3 do table.insert(parts, 1, s:sub(-3)); s = s:sub(1, -4) end
    if #s > 0 then table.insert(parts, 1, s) end
    return table.concat(parts, ",")
end

--=== Парсер суммы с поддержкой М, м, M, m ===--
local function parseAmount(text)
    local t = tostring(text):gsub("%s+", "")
    local num, m = t:match("^([%d%.]+)(.)$")
    if num and m then
        local letters = {["M"]=true,["m"]=true,["М"]=true,["м"]=true}
        if letters[m] then
            return tonumber(num) * 1_000_000
        end
    end
    return tonumber(t)
end

local function computePrice(tool)
    if not tool then return 0, 1 end
    local rawName = tool.Name:gsub("%b[]", ""):gsub("^%s+", ""):gsub("%s+$", ""):lower()
    local weight = (tool:FindFirstChild("Weight") and tool.Weight.Value) or 1
    local rawVars = {}
    for bracket in tool.Name:gmatch("%b[]") do
        local content = bracket:sub(2, -2)
        for v in content:gmatch("([^,]+)") do
            table.insert(rawVars, v:match("^%s*(.-)%s*$"))
        end
    end
    local variants = {}
    local synonyms = { monolith = "Moonlit" }
    for _, rv in ipairs(rawVars) do
        local key = rv:lower()
        if synonyms[key] then
            table.insert(variants, synonyms[key])
        else
            local found = false
            for vmk in pairs(variantMultipliers) do
                if vmk:lower() == key then
                    table.insert(variants, vmk)
                    found = true
                    break
                end
            end
            if not found then table.insert(variants, rv) end
        end
    end
    local primaryMul = variantMultipliers.Default
    local foundPrimary = false
    for _, v in ipairs(variants) do
        if not foundPrimary and (v == "Golden" or v == "Gold" or v == "Rainbow") then
            primaryMul = variantMultipliers[v]
            foundPrimary = true
        end
    end
    local addSum = 0
    for _, v in ipairs(variants) do
        if not (foundPrimary and (v == "Golden" or v == "Gold" or v == "Rainbow")) then
            addSum = addSum + (variantMultipliers[v] or 0)
        end
    end
    local totalMul = primaryMul * (1 + addSum)
    local price
    if rawName == "mushroom" then
        local base = math.max(241.6 * weight * weight, 136277.5)
        price = math.floor(base * totalMul)
    elseif rawName == "grape" then
        local base = math.max((7850/9) * weight * weight, 7084.625)
        price = math.floor(base * totalMul)
        price = price * 100
    elseif rawName == "pepper" then
        local base = math.max(320 * weight * weight, 7220)
        price = math.floor(base * totalMul)
    elseif rawName == "cacao" then
        local base = math.max((1375/8) * weight * weight, 9927.5)
        price = math.floor(base * totalMul)
    elseif rawName == "mango" then
        local baseFixed, extraRate = 5888, 1100
        local extra = math.max(weight - 15, 0)
        price = math.floor((baseFixed + extra * extraRate) * totalMul)
    else
        local perKg = fruitPrices[rawName] or 0
        price = math.floor(perKg * weight * totalMul)
    end
    return price
end

--=== LOGIC: Автосбор и возврат ===--
local lastCollected = {}

local function collectItemsForTargetAmount(targetAmount)
    local backpack = player.Backpack
    if not backpack then return end
    local items = {}
    for _, tool in pairs(backpack:GetChildren()) do
        if tool:IsA("Tool") and tool:FindFirstChild("Weight") then
            local rawName = tool.Name:gsub("%b[]", ""):gsub("^%s+", ""):gsub("%s+$", ""):lower()
            if allowedFruits[rawName] then
                local price = computePrice(tool)
                table.insert(items, {tool = tool, price = price, name = rawName})
            end
        end
    end
    table.sort(items, function(a, b) return a.price > b.price end)
    -- 1. Одиночное
    for _, v in ipairs(items) do
        if v.price >= targetAmount*minPercent and v.price <= targetAmount*maxPercent then
            v.tool.Parent = player.Character
            lastCollected = {v.tool}
            statusLabel.Text = "Собрано одним фруктом:"
            collectSumLabel.Text = formatNumber(v.price)
            return
        end
    end
    -- 2. Два/три фрукта (комбинация)
    for i = 1, #items do
        for j = i+1, #items do
            local s = items[i].price + items[j].price
            if s >= targetAmount*minPercent and s <= targetAmount*maxPercent then
                items[i].tool.Parent = player.Character
                items[j].tool.Parent = player.Character
                lastCollected = {items[i].tool, items[j].tool}
                statusLabel.Text = "Собрано двумя фруктами:"
                collectSumLabel.Text = formatNumber(s)
                return
            end
            for k = j+1, #items do
                local ss = s + items[k].price
                if ss >= targetAmount*minPercent and ss <= targetAmount*maxPercent then
                    items[i].tool.Parent = player.Character
                    items[j].tool.Parent = player.Character
                    items[k].tool.Parent = player.Character
                    lastCollected = {items[i].tool, items[j].tool, items[k].tool}
                    statusLabel.Text = "Собрано тремя фруктами:"
                    collectSumLabel.Text = formatNumber(ss)
                    return
                end
            end
        end
    end
    -- 3. Жадный вариант (если ничего не подошло)
    local sum, used = 0, {}
    lastCollected = {}
    for _, v in ipairs(items) do
        if sum < targetAmount*minPercent then
            v.tool.Parent = player.Character
            sum = sum + v.price
            table.insert(used, v.tool.Name)
            table.insert(lastCollected, v.tool)
        end
        if sum >= targetAmount*minPercent and sum <= targetAmount*maxPercent then break end
    end
    statusLabel.Text = "Собрано (жадно):"
    collectSumLabel.Text = formatNumber(sum)
end

collectBtn.MouseButton1Click:Connect(function()
    local n = parseAmount(amount.Text)
    if n then
        collectItemsForTargetAmount(n)
    else
        statusLabel.Text = "Введите корректное число!"
        collectSumLabel.Text = ""
    end
end)

returnBtn.MouseButton1Click:Connect(function()
    for _, tool in ipairs(lastCollected) do
        if tool and tool.Parent == player.Character then
            tool.Parent = player.Backpack
        end
    end
    statusLabel.Text = "Все предметы возвращены."
    collectSumLabel.Text = ""
    lastCollected = {}
    amount.Text = "" -- очищаем поле суммы!
end)

statusLabel.Text = "Ожидание..."
collectSumLabel.Text = ""

--=== Перемещение меню (Drag'n'Drop, фикс "улёта") ===--
local dragging = false
local dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    mainFrame.Position = UDim2.new(
        startPos.X.Scale, startPos.X.Offset + delta.X,
        startPos.Y.Scale, startPos.Y.Offset + delta.Y
    )
end

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or
       input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

mainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or
       input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- Всё готово!
