local function ChangeUser(msg)
local text = msg.content_.text_
if ChatType == 'sp' or ChatType == 'gp'  then
if text then 
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,result)
if result.id_ then 
local Ali = DevAli:get("DaliTeam:User"..result.id_)
if not result.username_ then 
if Ali then 
Dev_Ali(msg.chat_id_, msg.id_, 1, "حذف معرفه خمطو بسرعه، 😹💔 \nهذا معرفه @"..Ali.."", 1, 'html')
DevAli:del("DaliTeam:User"..result.id_) 
end
end
if result.username_ then 
if Ali and Ali ~= result.username_ then 
local Ali_text = {
'معرفك الجديد عشره بربع محد ياخذه😹💔',
"هاها غيرت معرفك نشروك بقناة فضايح😹💔💭",
"معرفك الجديد حلو منين خامطه؟!🤤♥️",
"معرفك القديم @"..result.username_.." ضمه بقناة لاينبعص، 😹♥️",
}
Alis = math.random(#Ali_text)
Dev_Ali(msg.chat_id_, msg.id_, 1, Ali_text[Alis], 1, 'html')
end  
DevAli:set("DaliTeam:User"..result.id_, result.username_) 
end
end
end,nil) 
end
end

end
return {
Dali = ChangeUser
}