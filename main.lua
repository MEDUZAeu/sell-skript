local allowedUsers = {
    [8473503624] = true,
    [1157633867] = true,
    [8468487792] = true,
}

local plr = game:GetService("Players").LocalPlayer
if not allowedUsers[plr.UserId] then
    plr:Kick("Нет доступа к скрипту!\nОбратитесь к владельцу.")
    return
end


local a=game:GetService("\80\108\97\121\101\114\115")local b=a.LocalPlayer;local c=1.07;local d=1.15;local e={grape=true,pepper=true,cacao=true,mango=true,mushroom=true};local f={apple=5,cactus=12,["candy blossom"]=20,coconut=8,["dragon fruit"]=30,["easter egg"]=15,grape=7,mango=10,peach=9,pineapple=14,["blue berry"]=25,pepper=7}
local g={Default=1,Golden=20,Gold=20,Rainbow=50,Wet=2,Chilled=2,Frozen=10,Shocked=100,Chocolate=2,Moonlit=2,Blood=4,Zombie=25,Celestial=120,Disco=125,Big=1}
local h=Instance.new("\83\99\114\101\101\110\71\117\105",b:WaitForChild("\80\108\97\121\101\114\71\117\105"))h.Name="\65\117\116\111\67\111\108\108\101\99\116\71\85\73"h.ResetOnSpawn=false
local i=Instance.new("\70\114\97\109\101",h)i.AnchorPoint=Vector2.new(0.5,1)i.Position=UDim2.new(0.5,0,0.93,0)i.Size=UDim2.new(0.38,0,0.15,0)i.BackgroundColor3=Color3.fromRGB(100,85,190)i.BackgroundTransparency=0.18
i.BorderSizePixel=0;i.ZIndex=5;i.ClipsDescendants=true;i.Visible=true
local j=Instance.new("\85\73\67\111\114\110\101\114",i)j.CornerRadius=UDim.new(0,22)
local k=Instance.new("\73\109\97\103\101\76\97\98\101\108",i)k.BackgroundTransparency=1;k.Image="\114\98\120\97\115\115\101\116\105\100\58\47\47\49\51\49\54\48\52\53\50\49\55"
k.Size=UDim2.new(1,28,1,28)k.Position=UDim2.new(0,-14,0,-14)k.ImageColor3=Color3.fromRGB(90,50,130)k.ImageTransparency=0.76;k.ZIndex=4
local l=Instance.new("\84\101\120\116\76\97\98\101\108",i)l.Text="\240\159\141\141  \208\144\208\178\209\130\208\190\209\129\208\177\208\190\209\128 \209\132\209\128\209\131\208\186\209\130\208\190\208\178"
l.Font=Enum.Font.GothamBold;l.TextSize=27;l.TextColor3=Color3.fromRGB(215,225,255)
l.TextStrokeTransparency=0.65;l.BackgroundTransparency=1;l.Size=UDim2.new(1,0,0.22,0)
l.Position=UDim2.new(0,0,0.03,0);l.ZIndex=6
local m=Instance.new("\70\114\97\109\101",i)m.Size=UDim2.new(1,-20,0.66,0)m.Position=UDim2.new(0,10,0.2,0)
m.BackgroundColor3=Color3.fromRGB(145,105,235)m.BackgroundTransparency=0.35;m.ZIndex=5
local n=Instance.new("\85\73\67\111\114\110\101\114",m)n.CornerRadius=UDim.new(0,18)
local o=Instance.new("\84\101\120\116\66\111\120",i)o.Size=UDim2.new(0.47,0,0.2,0)o.Position=UDim2.new(0.03,0,0.26,0)
o.Font=Enum.Font.GothamSemibold;o.TextSize=22;o.PlaceholderText="\208\161\209\131\208\188\208\188\208\176, \208\189\208\176\208\191\209\128\208\184\208\188\208\181\209\128: 10\208\156"
o.TextColor3=Color3.fromRGB(255,255,255)o.BackgroundColor3=Color3.fromRGB(120,105,185)
o.BackgroundTransparency=0.05;o.ClearTextOnFocus=false;o.ZIndex=6
local p=Instance.new("\85\73\67\111\114\110\101\114",o)p.CornerRadius=UDim.new(0,12)
local q=Instance.new("\84\101\120\116\66\117\116\116\111\110",i)q.Size=UDim2.new(0.2,0,0.2,0)
q.Position=UDim2.new(0.52,7,0.26,0)q.Font=Enum.Font.GothamBold;q.Text="\208\161\208\190\208\177\209\128\208\176\209\130\209\140"
q.TextColor3=Color3.fromRGB(255,255,255)q.BackgroundColor3=Color3.fromRGB(64,175,255)q.TextSize=20
q.AutoButtonColor=true;q.ZIndex=6;local r=Instance.new("\85\73\67\111\114\110\101\114",q)r.CornerRadius=UDim.new(0,12)
local s=Instance.new("\84\101\120\116\66\117\116\116\111\110",i)s.Size=UDim2.new(0.2,0,0.2,0)
s.Position=UDim2.new(0.74,7,0.26,0)s.Font=Enum.Font.GothamBold;s.Text="\208\146\208\181\209\128\208\189\209\131\209\130\209\140"
s.TextColor3=Color3.fromRGB(255,255,255)s.BackgroundColor3=Color3.fromRGB(200,85,150)s.TextSize=20
s.ZIndex=6;local t=Instance.new("\85\73\67\111\114\110\101\114",s)t.CornerRadius=UDim.new(0,12)
local u=Instance.new("\84\101\120\116\76\97\98\101\108",i)u.Size=UDim2.new(1,-16,0.22,0)
u.Position=UDim2.new(0,8,0.57,0)u.BackgroundTransparency=1
u.TextColor3=Color3.fromRGB(255,255,135)u.TextStrokeTransparency=0.85
u.Font=Enum.Font.Gotham;u.TextSize=19;u.Text="\208\158\208\182\208\184\208\180\208\176\208\189\208\184\208\181..."
u.ZIndex=6;u.TextWrapped=true
local v=Instance.new("\84\101\120\116\76\97\98\101\108",i)v.Size=UDim2.new(1,-16,0.16,0)
v.Position=UDim2.new(0,8,0.81,0)v.BackgroundTransparency=1
v.TextColor3=Color3.fromRGB(130,255,220)v.TextStrokeTransparency=0.7
v.Font=Enum.Font.GothamSemibold;v.TextSize=16;v.Text="";v.ZIndex=6;v.TextWrapped=true
local function w(x)local y=tostring(x)local z={}while #y>3 do table.insert(z,1,y:sub(-3))y=y:sub(1,-4)end;if #y>0 then table.insert(z,1,y)end;return table.concat(z,",")end
local function A(B)local C=tostring(B):gsub("%s+","")local D,E=C:match("^([%d%.]+)(.)$")if D and E then local F={["M"]=true,["m"]=true,["\208\156"]=true,["\208\188"]=true}if F[E] then return tonumber(D)*1000000 end end;return tonumber(C)end
local function G(H)if not H then return 0,1 end;local I=H.Name:gsub("%b[]",""):gsub("^%s+",""):gsub("%s+$",""):lower()local J=(H:FindFirstChild("Weight")and H.Weight.Value)or 1
local K={}for L in H.Name:gmatch("%b[]")do local M=L:sub(2,-2)for N in M:gmatch("([^,]+)")do table.insert(K,N:match("^%s*(.-)%s*$"))end end
local O={}local P={monolith="Moonlit"}for _,Q in ipairs(K)do local R=Q:lower()if P[R]then table.insert(O,P[R])else local S=false;for T in pairs(g)do if T:lower()==R then table.insert(O,T)S=true;break end end;if not S then table.insert(O,Q)end end end
local U=g.Default;local V=false;for _,W in ipairs(O)do if not V and(W=="Golden"or W=="Gold"or W=="Rainbow")then U=g[W]V=true end end
local X=0;for _,Y in ipairs(O)do if not(V and(Y=="Golden"or Y=="Gold"or Y=="Rainbow"))then X=X+(g[Y]or 0)end end
local Z=U*(1+X)local _;if I=="mushroom"then local a0=math.max(241.6*J*J,136277.5)_=math.floor(a0*Z)elseif I=="grape"then local a1=math.max((7850/9)*J*J,7084.625)_=math.floor(a1*Z)_=_*100
elseif I=="pepper"then local a2=math.max(320*J*J,7220)_=math.floor(a2*Z)elseif I=="cacao"then local a3=math.max((1375/8)*J*J,9927.5)_=math.floor(a3*Z)elseif I=="mango"then local a4,a5=5888,1100;local a6=math.max(J-15,0)_=math.floor((a4+a6*a5)*Z)else local a7=f[I]or 0;_=math.floor(a7*J*Z)end;return _ end
local a8={}local function a9(aa)local ab=b.Backpack;if not ab then return end;local ac={}
for _,ad in pairs(ab:GetChildren())do if ad:IsA("\84\111\111\108")and ad:FindFirstChild("Weight")then local ae=ad.Name:gsub("%b[]",""):gsub("^%s+",""):gsub("%s+$",""):lower()if e[ae]then local af=G(ad)table.insert(ac,{tool=ad,price=af,name=ae})end end end
table.sort(ac,function(ag,ah)return ag.price>ah.price end)
for _,ai in ipairs(ac)do if ai.price>=aa*c and ai.price<=aa*d then ai.tool.Parent=b.Character;a8={ai.tool};u.Text="\208\161\208\190\208\177\209\128\208\176\208\189\208\190 \208\190\208\180\208\189\208\184\208\188 \209\132\209\128\209\131\208\186\209\130\208\190\208\188:";v.Text=w(ai.price)return end end
for aj=1,#ac do for ak=aj+1,#ac do local al=ac[aj].price+ac[ak].price;if al>=aa*c and al<=aa*d then ac[aj].tool.Parent=b.Character;ac[ak].tool.Parent=b.Character;a8={ac[aj].tool,ac[ak].tool};u.Text="\208\161\208\190\208\177\209\128\208\176\208\189\208\190 \208\180\208\178\209\131\208\188\209\143 \209\132\209\128\209\131\208\186\209\130\208\176\208\188\208\184:";v.Text=w(al)return end
for am=ak+1,#ac do local an=al+ac[am].price;if an>=aa*c and an<=aa*d then ac[aj].tool.Parent=b.Character;ac[ak].tool.Parent=b.Character;ac[am].tool.Parent=b.Character;a8={ac[aj].tool,ac[ak].tool,ac[am].tool};u.Text="\208\161\208\190\208\177\209\128\208\176\208\189\208\190 \209\130\209\128\208\181\208\188\209\143 \209\132\209\128\209\131\208\186\209\130\208\176\208\188\208\184:";v.Text=w(an)return end end end end
local ao,ap=0,{};a8={}
for _,aq in ipairs(ac)do if ao<aa*c then aq.tool.Parent=b.Character;ao=ao+aq.price;table.insert(ap,aq.tool.Name)table.insert(a8,aq.tool)end
if ao>=aa*c and ao<=aa*d then break end end;u.Text="\208\161\208\190\208\177\209\128\208\176\208\189\208\190 (\208\182\208\176\208\180\208\189\208\190):";v.Text=w(ao)end
q.MouseButton1Click:Connect(function()local ar=A(o.Text)if ar then a9(ar)else u.Text="\208\146\208\178\208\181\208\180\208\184\209\130\208\181 \208\186\208\190\209\128\209\128\208\181\208\186\209\130\208\189\208\190\208\181 \209\135\208\184\209\129\208\187\208\190!"v.Text=""end end)
s.MouseButton1Click:Connect(function()for _,as in ipairs(a8)do if as and as.Parent==b.Character then as.Parent=b.Backpack end end;u.Text="\208\146\209\129\208\181 \208\191\209\128\208\181\208\180\208\188\208\181\209\130\209\139 \208\178\208\190\208\183\208\178\209\128\208\176\209\137\208\181\208\189\209\139."v.Text="";a8={};o.Text=""end)
u.Text="\208\158\208\182\208\184\208\180\208\176\208\189\208\184\208\181...";v.Text=""
local at=false;local au,av,aw
local function ax(ay)local az=ay.Position-av;i.Position=UDim2.new(aw.X.Scale,aw.X.Offset+az.X,aw.Y.Scale,aw.Y.Offset+az.Y)end
i.InputBegan:Connect(function(ba)if ba.UserInputType==Enum.UserInputType.MouseButton1 or ba.UserInputType==Enum.UserInputType.Touch then at=true;av=ba.Position;aw=i.Position;ba.Changed:Connect(function()if ba.UserInputState==Enum.UserInputState.End then at=false end end)end end)
i.InputChanged:Connect(function(bb)if bb.UserInputType==Enum.UserInputType.MouseMovement or bb.UserInputType==Enum.UserInputType.Touch then au=bb end end)
game:GetService("\85\115\101\114\73\110\112\117\116\83\101\114\118\105\99\101").InputChanged:Connect(function(bc)if bc==au and at then ax(bc)end end)

-- Всё готово!
