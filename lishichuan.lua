local JM
local Cash = game:GetService("Players").LocalPlayer.leaderstats.Cash

if Cash.Value >= 150000 then
JM = true
end

if JM then
game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "『通过』"; Text ="JM"; Duration = 2; })
--[[
JM火箭发射模拟器 3.0
--]]
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/anlushanjinchangantangwanle/refs/heads/main/jmjmjmjmjmjm114514.txt"))()
else
game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "『不通过』"; Text ="JM"; Duration = 2; })
end
