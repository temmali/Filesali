local function AutoFile(msg)
local text = msg.content_.text_
if Sudo(msg) then
if text == 'تفعيل النسخه التلقائيه' or text == 'تفعيل جلب نسخه الكروبات' or text == 'تفعيل عمل نسخه للمجموعات' then   
Dev_Ali(msg.chat_id_,msg.id_, 1, "⌁︙تم تفعيل جلب نسخة الكروبات التلقائيه\n⌁︙سيتم ارسال نسخه تلقائيه للكروبات كل يوم الى خاص المطور الاساسي", 1, 'md')
DevAli:del(Dali.."Ali:Lock:AutoFile")
end
if text == 'تعطيل النسخه التلقائيه' or text == 'تعطيل جلب نسخه الكروبات' or text == 'تعطيل عمل نسخه للمجموعات' then  
Dev_Ali(msg.chat_id_,msg.id_, 1, "⌁︙تم تعطيل جلب نسخة الكروبات التلقائيه", 1, 'md')
DevAli:set(Dali.."Ali:Lock:AutoFile",true) 
end 
end

if (text and not DevAli:get(Dali.."Ali:Lock:AutoFile")) then
Time = DevAli:get(Dali.."Ali:AutoFile:Time")
if Time then 
if Time ~= os.date("%x") then 
local list = DevAli:smembers(Dali..'Ali:Groups') 
local BotName = (DevAli:get(Dali.."Ali:NameBot") or 'بروكس')
local GetJson = '{"BotId": '..Dali..',"BotName": "'..BotName..'","GroupsList":{'  
for k,v in pairs(list) do 
LinkGroups = DevAli:get(Dali.."Ali:Groups:Links"..v)
Welcomes = DevAli:get(Dali..'Ali:Groups:Welcomes'..v) or ''
AliConstructors = DevAli:smembers(Dali..'Ali:AliConstructor:'..v)
BasicConstructors = DevAli:smembers(Dali..'Ali:BasicConstructor:'..v)
Constructors = DevAli:smembers(Dali..'Ali:Constructor:'..v)
Managers = DevAli:smembers(Dali..'Ali:Managers:'..v)
Admis = DevAli:smembers(Dali..'Ali:Admins:'..v)
Vips = DevAli:smembers(Dali..'Ali:VipMem:'..v)
if k == 1 then
GetJson = GetJson..'"'..v..'":{'
else
GetJson = GetJson..',"'..v..'":{'
end
if #Vips ~= 0 then 
GetJson = GetJson..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Admis ~= 0 then
GetJson = GetJson..'"Admis":['
for k,v in pairs(Admis) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Managers ~= 0 then
GetJson = GetJson..'"Managers":['
for k,v in pairs(Managers) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Constructors ~= 0 then
GetJson = GetJson..'"Constructors":['
for k,v in pairs(Constructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #BasicConstructors ~= 0 then
GetJson = GetJson..'"BasicConstructors":['
for k,v in pairs(BasicConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #AliConstructors ~= 0 then
GetJson = GetJson..'"AliConstructors":['
for k,v in pairs(AliConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if LinkGroups then
GetJson = GetJson..'"LinkGroups":"'..LinkGroups..'",'
end
GetJson = GetJson..'"Welcomes":"'..Welcomes..'"}'
end
GetJson = GetJson..'}}'
local File = io.open('./'..Dali..'.json', "w")
File:write(GetJson)
File:close()
local Ali = 'https://api.telegram.org/bot' .. TokenBot .. '/sendDocument'
local curl = 'curl "' .. Ali .. '" -F "chat_id='..DevId..'" -F "document=@'..Dali..'.json' .. '" -F "caption=⌁︙نسخه تلقائيه تحتوي على ↫ '..#list..' مجموعه"'
io.popen(curl)
io.popen('fm -fr '..Dali..'.json')
DevAli:set(Dali.."Ali:AutoFile:Time",os.date("%x"))
end
else 
DevAli:set(Dali.."Ali:AutoFile:Time",os.date("%x"))
end
end

end
return {
Dali = AutoFile
}