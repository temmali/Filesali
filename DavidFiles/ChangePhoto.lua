local function ChangePhoto(msg)
local text = msg.content_.text_
if ChatType == 'sp' or ChatType == 'gp'  then
if text then 
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,result)
if result.id_ then 
local Ali = DevAli:get("DaliTeam:Photo"..result.id_)
if not result.profile_photo_ then 
if Ali then 
Dev_Ali(msg.chat_id_, msg.id_, 1, "حذف كل صوره مضروب بوري، 😹💔", 1, 'html')
DevAli:del("DaliTeam:Photo"..result.id_) 
end
end
if result.profile_photo_ then 
if Ali and Ali ~= result.profile_photo_.big_.persistent_id_ then 
local Ali_text = {
"وفف مو صوره غنبلةة، 🤤♥️",
"طالع صاكك بالصوره الجديده ممكن نرتبط؟ ، 🤤♥️",
"حطيت صوره جديده عود شوفوني اني صاكك بنات، 😹♥️",
"اححح شنيي هالصوره الجديده، 🤤♥️",
}
Ali3 = math.random(#Ali_text)
Dev_Ali(msg.chat_id_, msg.id_, 1, Ali_text[Ali3], 1, 'html')
end  
DevAli:set("DaliTeam:Photo"..result.id_, result.profile_photo_.big_.persistent_id_) 
end
end
end,nil) 
end
end

end
return {
Dali = ChangePhoto
}