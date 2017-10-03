
---------------unlock_id-------------------
function lock_id(msg, data, target)
if not is_mod(msg) then
 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"
end
local lock_id = data[tostring(target)]["settings"]["lock_id"] 
if lock_id == "yes" then
return '💢¦ _اهلا عزيزي_ \n💢¦ _الايدي بالتاكيد تم ايقافها ✔️_'
else
data[tostring(target)]["settings"]["lock_id"] = "yes"
save_data(_config.moderation.data, data) 
return '💢¦ _اهلا عزيزي_ \n💢¦ _تم ايقاف الايدي  ✔️_'
end
end

function unlock_id(msg, data, target)
 if not is_mod(msg) then
 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"
end 
local lock_id = data[tostring(target)]["settings"]["lock_id"]
 if lock_id == "no" then
return '💢¦ _اهلا عزيزي_ \n💢¦ _الايدي بالتاكيد تم تشغيلها ✔️_'
else 
data[tostring(target)]["settings"]["lock_id"] = "no"
save_data(_config.moderation.data, data) 
return '💢¦ _اهلا عزيزي_ \n💢¦ _تم تشغيل الايدي  ✔️_'
end
end

---------------unlock_bots_inkick-------------------
function unlock_bots_inkick(msg, data, target)
if not is_mod(msg) then
 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"
end
local lock_bots_inkick = data[tostring(target)]["settings"]["lock_bots_inkick"] 
if lock_bots_inkick == "no" then
return '💢¦ _اهلا عزيزي_ \n💢¦ _البوتات بالطرد بالتاكيد تم فتحها ✔️_'
else
data[tostring(target)]["settings"]["lock_bots_inkick"] = "no"
save_data(_config.moderation.data, data) 
return '💢¦ _اهلا عزيزي_ \n💢¦ _تم فتح البوتات بالطرد  ✔️_'
end
end

function lock_bots_inkick(msg, data, target)
 if not is_mod(msg) then
 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"
end 
local lock_bots_inkick = data[tostring(target)]["settings"]["lock_bots_inkick"]
 if lock_bots_inkick == "yes" then
return '💢¦ _اهلا عزيزي_ \n💢¦ _البوتات بالطرد بالتاكيد تم قفلها ✔️_'
else 
data[tostring(target)]["settings"]["lock_bots_inkick"] = "yes"
save_data(_config.moderation.data, data) 
return '💢¦ _اهلا عزيزي_ \n💢¦ _تم قفل البوتات بالطرد  ✔️_'
end
end

---------------Lock replay-------------------
function lock_replay(msg, data, target)
if not is_mod(msg) then
 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"
end
local replay = data[tostring(target)]["settings"]["replay"] 
if replay == "no" then
return '💢¦ _اهلا عزيزي_ \n💢¦ _الردود بالتاكيد تم ايقافه ✔️_'
else
data[tostring(target)]["settings"]["replay"] = "no"
save_data(_config.moderation.data, data) 
return '💢¦ _اهلا عزيزي_ \n💢¦ _تم ايقاف الردود  ✔️_'
end
end

function unlock_replay(msg, data, target)
 if not is_mod(msg) then
 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"
end 
local replay = data[tostring(target)]["settings"]["replay"]
 if replay == "yes" then
return '💢¦ _اهلا عزيزي_ \n💢¦ _الردود بالتاكيد تم تشغيله ✔️_'
else 
data[tostring(target)]["settings"]["replay"] = "yes"
save_data(_config.moderation.data, data) 
return '💢¦ _اهلا عزيزي_ \n💢¦ _تم تشغيل الردود  ✔️_'
end
end

---------------Lock Link-------------------
function lock_link(msg, data, target)

if not is_mod(msg) then
 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"
end

local lock_link = data[tostring(target)]["settings"]["lock_link"] 
if lock_link == "yes" then
return '💢¦ _اهلا عزيزي_ \n💢¦ _الروابط بالتأكيد تم قفلها_ ✔️'
else
data[tostring(target)]["settings"]["lock_link"] = "yes"
save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم قفل الروابط_ ✔️'

end
end

function unlock_link(msg, data, target)

 if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"

end 

local lock_link = data[tostring(target)]["settings"]["lock_link"]
 if lock_link == "no" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _الروابط بالتأكيد تم فتحها_ ✔️'

else 
data[tostring(target)]["settings"]["lock_link"] = "no" save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم فتح الروابط_ ✔️'

end
end

---------------Lock Tag-------------------
function lock_tag(msg, data, target) 

if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"

end

local lock_tag = data[tostring(target)]["settings"]["lock_tag"] 
if lock_tag == "yes" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _التاك(#) بالتأكيد تم قفله_ ✔️'

else
 data[tostring(target)]["settings"]["lock_tag"] = "yes"
save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم قفل التاك(#)_ ✔️'

end
end

function unlock_tag(msg, data, target)

 if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"
 
end
local lock_tag = data[tostring(target)]["settings"]["lock_tag"]
 if lock_tag == "no" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _التاك(#) بالتأكيد تم فتحه_ ✔️'

else 
data[tostring(target)]["settings"]["lock_tag"] = "no" save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم فتح التاك(#)_ ✔️'
end
end

---------------Lock Mention-------------------
function lock_mention(msg, data, target)
 
if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"

end

local lock_mention = data[tostring(target)]["settings"]["lock_mention"] 
if lock_mention == "yes" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _التذكير بالتأكيد تم قفله_ ✔️'

else
 data[tostring(target)]["settings"]["lock_mention"] = "yes"
save_data(_config.moderation.data, data)

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم قفل التذكير_ ✔️'

end
end

function unlock_mention(msg, data, target)

 if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"
 
end 

local lock_mention = data[tostring(target)]["settings"]["lock_mention"]
 if lock_mention == "no" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _التذكير بالتأكيد تم فتحه_ ✔️'

else 
data[tostring(target)]["settings"]["lock_mention"] = "no" save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم فتح التذكير _✔️'

end
end


---------------Lock Edit-------------------
function lock_edit(msg, data, target) 

if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"

end

local lock_edit = data[tostring(target)]["settings"]["lock_edit"] 
if lock_edit == "yes" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _التعديل بالتأكيد تم قفله_ ✔️'

else
 data[tostring(target)]["settings"]["lock_edit"] = "yes"
save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم قفل التعديل_ ✔️'

end
end

function unlock_edit(msg, data, target)
if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"
end 

local lock_edit = data[tostring(target)]["settings"]["lock_edit"]
 if lock_edit == "no" then
return '💢¦ _اهلا عزيزي_ \n💢¦ _التعديل بالتأكيد تم فتحه_ ✔️'
else 
data[tostring(target)]["settings"]["lock_edit"] = "no" save_data(_config.moderation.data, data) 
return '💢¦ _اهلا عزيزي_ \n💢¦ _تم فتح التعديل_ ✔️'
end
end

---------------Lock spam-------------------
function lock_spam(msg, data, target) 

if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"

end

local lock_spam = data[tostring(target)]["settings"]["lock_spam"] 
if lock_spam == "yes" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _الكلايش بالتأكيد تم قفلها_ ✔️'

else
 data[tostring(target)]["settings"]["lock_spam"] = "yes"
save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم قفل الكلايش_ ✔️'

end
end

function unlock_spam(msg, data, target)

 if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"
 
end 

local lock_spam = data[tostring(target)]["settings"]["lock_spam"]
 if lock_spam == "no" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _الكلايش بالتأكيد تم فتحها_ ✔️'

else 
data[tostring(target)]["settings"]["lock_spam"] = "no" 
save_data(_config.moderation.data, data)

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم فتح الكلايش_ ✔️'

end
end

---------------Lock Flood-------------------
function lock_flood(msg, data, target) 

if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"

end

local lock_flood = data[tostring(target)]["settings"]["flood"] 
if lock_flood == "yes" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _التكرار بالتأكيد تم قفله_ ✔️'

else
 data[tostring(target)]["settings"]["flood"] = "yes"
save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم قفل التكرار_ ✔️'

end
end

function unlock_flood(msg, data, target)

 if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"

end 

local lock_flood = data[tostring(target)]["settings"]["flood"]
 if lock_flood == "no" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _التكرار بالتأكيد تم فتحه_ ✔️'

else 
data[tostring(target)]["settings"]["flood"] = "no" save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم فتح التكرار_ ✔️'

end
end

---------------Lock Bots-------------------
function lock_bots(msg, data, target) 

if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"

end

local lock_bots = data[tostring(target)]["settings"]["lock_bots"] 
if lock_bots == "yes" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _البوتات بالتأكيد تم قفلها_ ✔️'

else
 data[tostring(target)]["settings"]["lock_bots"] = "yes"
save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم قفل البوتات_ ✔️'

end
end

function unlock_bots(msg, data, target)

 if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"
 
end

local lock_bots = data[tostring(target)]["settings"]["lock_bots"]
 if lock_bots == "no" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _البوتات بالتأكيد تم فتحها_ ✔️'

else 
data[tostring(target)]["settings"]["lock_bots"] = "no" save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم فتح البوتات_ ✔️'

end
end

---------------Lock Join-------------------
function lock_join(msg, data, target) 

if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"

end

local lock_join = data[tostring(target)]["settings"]["lock_join"] 
if lock_join == "yes" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _الاضافه بالتاكيد تم قفلها  _ ✔️'

else
 data[tostring(target)]["settings"]["lock_join"] = "yes"
save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم قفل الاضافه_ ✔️'

end
end

function unlock_join(msg, data, target)

 if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"
end

local lock_join = data[tostring(target)]["settings"]["lock_join"]
 if lock_join == "no" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _الاضافه بالتاكيد تم فتحها  _ ✔️'

else 
data[tostring(target)]["settings"]["lock_join"] = "no"
save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم فتح الاضافه_ ✔️'

end
end

---------------Lock Markdown-------------------
function lock_markdown(msg, data, target) 

if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"

end

local lock_markdown = data[tostring(target)]["settings"]["lock_markdown"] 
if lock_markdown == "yes" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _الماركدون بالتاكيد تم قفله _ ✔️'

else
 data[tostring(target)]["settings"]["lock_markdown"] = "yes"
save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم قفل الماركدون_ ✔️'

end
end

function unlock_markdown(msg, data, target)

 if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"
 
end

local lock_markdown = data[tostring(target)]["settings"]["lock_markdown"]
 if lock_markdown == "no" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _الماركدون بالتأكيد تم فتحه_ ✔️'

else 
data[tostring(target)]["settings"]["lock_markdown"] = "no" save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم فتح الماركدون_ ✔️'

end
end

---------------Lock Webpage-------------------
function lock_webpage(msg, data, target) 

if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"

end

local lock_webpage = data[tostring(target)]["settings"]["lock_webpage"] 
if lock_webpage == "yes" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _الويب بالتأكيد تم قفله_ ✔️'

else
 data[tostring(target)]["settings"]["lock_webpage"] = "yes"
save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم قفل الويب_✔️'

end
end

function unlock_webpage(msg, data, target)

 if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"
 
end

local lock_webpage = data[tostring(target)]["settings"]["lock_webpage"]
 if lock_webpage == "no" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _الويب بالتأكيد تم فتحه_ ✔️'

else 
data[tostring(target)]["settings"]["lock_webpage"] = "no"
save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم فتح الويب_ ✔️'

end
end

---------------Lock Pin-------------------
function lock_pin(msg, data, target) 

if not is_mod(msg) then
 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"
end
local lock_pin = data[tostring(target)]["settings"]["lock_pin"] 
if lock_pin == "yes" then
return '💢¦ _اهلا عزيزي_ \n💢¦ _التثبيت بالتأكيد تم قفله_ ✔️'
else
 data[tostring(target)]["settings"]["lock_pin"] = "yes"
save_data(_config.moderation.data, data) 
return "💢¦ _اهلا عزيزي_ \n💢¦ _تم قفل التثبيت_✔️"
end
end

function unlock_pin(msg, data, target)
 if not is_mod(msg) then
 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"
end
local lock_pin = data[tostring(target)]["settings"]["lock_pin"]
 if lock_pin == "no" then
return '💢¦ _اهلا عزيزي_ \n💢¦ _التثبيت بالتأكيد تم فتحه_ ✔️'
else 
data[tostring(target)]["settings"]["lock_pin"] = "no"
save_data(_config.moderation.data, data) 
return '💢¦ _اهلا عزيزي_ \n💢¦ _تم فتح التثبيت_ ✔️'
end
end
--------Mutes---------

---------------Mute Gif-------------------
function mute_gif(msg, data, target) 

if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"

end

local mute_gif = data[tostring(target)]["mutes"]["mute_gif"] 
if mute_gif == "yes" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _المتحركه بالتأكيد تم قفلها_ ✔️'

else
 data[tostring(target)]["mutes"]["mute_gif"] = "yes" 
save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم قفل المتحركه_ ✔️'

end
end

function unmute_gif(msg, data, target)

 if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"

end 

local mute_gif = data[tostring(target)]["mutes"]["mute_gif"]
 if mute_gif == "no" then
return '💢¦ _اهلا عزيزي_ \n💢¦ _المتحركه بالتأكيد تم فتحها_ ✔️'

else 
data[tostring(target)]["mutes"]["mute_gif"] = "no"
 save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم فتح المتحركه_ ✔️'

end
end
---------------Mute Game-------------------
function mute_game(msg, data, target) 

if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"

end

local mute_game = data[tostring(target)]["mutes"]["mute_game"] 
if mute_game == "yes" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _الالعاب بالتأكيد تم قفلها_ ✔️'

else
 data[tostring(target)]["mutes"]["mute_game"] = "yes" 
save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم قفل الالعاب_ ✔️'

end
end

function unmute_game(msg, data, target)

 if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"
 
end

local mute_game = data[tostring(target)]["mutes"]["mute_game"]
 if mute_game == "no" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _الألعاب بالتأكيد تم فتحها_ ✔️'

else 
data[tostring(target)]["mutes"]["mute_game"] = "no"
 save_data(_config.moderation.data, data)

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم فتح الألعاب_ ✔️'

end
end
---------------Mute Inline-------------------
function mute_inline(msg, data, target) 

if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"

end

local mute_inline = data[tostring(target)]["mutes"]["mute_inline"] 
if mute_inline == "yes" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _الانلاين بالتأكيد تم قفله_ ✔️'

else
 data[tostring(target)]["mutes"]["mute_inline"] = "yes" 
save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم قفل الانلاين_ ✔️'

end
end

function unmute_inline(msg, data, target)

 if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"

end 

local mute_inline = data[tostring(target)]["mutes"]["mute_inline"]
 if mute_inline == "no" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _الانلاين بالتأكيد تم فتحه_ ✔️'

else 
data[tostring(target)]["mutes"]["mute_inline"] = "no"
 save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم فتح الانلاين_ ✔️'

end
end
---------------Mute Text-------------------
function mute_text(msg, data, target) 

if not is_mod(msg) then
 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"

end

local mute_text = data[tostring(target)]["mutes"]["mute_text"] 
if mute_text == "yes" then
return '💢¦ _اهلا عزيزي_ \n💢¦ _الدرشه بالتأكيد تم قفلها_ ✔️'

else
 data[tostring(target)]["mutes"]["mute_text"] = "yes" 
save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم قفل الدردشه_ ✔️'

end
end

function unmute_text(msg, data, target)

 if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"
 
end

local mute_text = data[tostring(target)]["mutes"]["mute_text"]
 if mute_text == "no" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _الدردشه بالتأكيد تم فتحها_ ✔️'

else 
data[tostring(target)]["mutes"]["mute_text"] = "no"
 save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم فتح الدردشه_ ✔️'

end
end
---------------Mute photo-------------------
function mute_photo(msg, data, target) 

if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"

end

local mute_photo = data[tostring(target)]["mutes"]["mute_photo"] 
if mute_photo == "yes" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _الصور بالتأكيد تم قفلها_ ✔️'

else
 data[tostring(target)]["mutes"]["mute_photo"] = "yes" 
save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم قفل الصور_ ✔️'

end
end

function unmute_photo(msg, data, target)

 if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"

end
 
local mute_photo = data[tostring(target)]["mutes"]["mute_photo"]
 if mute_photo == "no" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _الصور بالتأكيد تم فتحها_ ✔️'

else 
data[tostring(target)]["mutes"]["mute_photo"] = "no"
 save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم فتح الصور_ ✔️'

end
end
---------------Mute Video-------------------
function mute_video(msg, data, target) 

if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"

end

local mute_video = data[tostring(target)]["mutes"]["mute_video"] 
if mute_video == "yes" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _الفيديو بالتأكيد تم قفلها_ ✔️'

else
 data[tostring(target)]["mutes"]["mute_video"] = "yes" 
save_data(_config.moderation.data, data)

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم قفل الفيديو_ ✔️'

end
end

function unmute_video(msg, data, target)

 if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"

end 

local mute_video = data[tostring(target)]["mutes"]["mute_video"]
 if mute_video == "no" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _الفيديو يالتأكيد تم فتحها_ ✔️'

else 
data[tostring(target)]["mutes"]["mute_video"] = "no"
 save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم فتح الفيديو_ ✔️'
end
end
---------------Mute Audio-------------------
function mute_audio(msg, data, target) 

if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"

end

local mute_audio = data[tostring(target)]["mutes"]["mute_audio"] 
if mute_audio == "yes" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _البصمات بالتأكيد تم قفلها_ ✔️'

else
 data[tostring(target)]["mutes"]["mute_audio"] = "yes" 
save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم قفل البصمات_ ✔️'

end
end

function unmute_audio(msg, data, target)

 if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"

end 

local mute_audio = data[tostring(target)]["mutes"]["mute_audio"]
 if mute_audio == "no" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _البصمات بالتأكيد تم فتحها_ ✔️'

else 
data[tostring(target)]["mutes"]["mute_audio"] = "no"
 save_data(_config.moderation.data, data)

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم فتح البصمات_ ✔️'

end
end
---------------Mute Voice-------------------
function mute_voice(msg, data, target) 

if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"

end

local mute_voice = data[tostring(target)]["mutes"]["mute_voice"] 
if mute_voice == "yes" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _الصوت بالتأكيد تم قفله_ ✔️'

else
 data[tostring(target)]["mutes"]["mute_voice"] = "yes" 
save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم قفل الصوت_ ✔️'
end

end

function unmute_voice(msg, data, target)

 if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"

end 

local mute_voice = data[tostring(target)]["mutes"]["mute_voice"]
 if mute_voice == "no" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _الصوت بالتأكيد تم فتحه_ ✔️'

else 
data[tostring(target)]["mutes"]["mute_voice"] = "no"
 save_data(_config.moderation.data, data)

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم فتح الصوت_ ✔️'

end
end
---------------Mute Sticker-------------------
function mute_sticker(msg, data, target) 

if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"

end

local mute_sticker = data[tostring(target)]["mutes"]["mute_sticker"] 
if mute_sticker == "yes" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _الملصقات بالتأكيد تم قفلها_ ✔️'

else
 data[tostring(target)]["mutes"]["mute_sticker"] = "yes" 
save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم قفل الملصقات_ ✔️'

end
end

function unmute_sticker(msg, data, target)

 if not is_mod(msg) then
 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"
end

local mute_sticker = data[tostring(target)]["mutes"]["mute_sticker"]
 if mute_sticker == "no" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _الملصقات بالتأكيد تم فتحها_ ✔️'

else 
data[tostring(target)]["mutes"]["mute_sticker"] = "no"
 save_data(_config.moderation.data, data)

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم فتح الملصقات_ ✔️'
 
end
end
---------------Mute Contact-------------------
function mute_contact(msg, data, target) 

if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"

end

local mute_contact = data[tostring(target)]["mutes"]["mute_contact"] 
if mute_contact == "yes" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _جهات الاتصال بالتأكيد تم قفلها_ ✔️'

else
 data[tostring(target)]["mutes"]["mute_contact"] = "yes" 
save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم قفل جهات الاتصال_ ✔️'

end
end

function unmute_contact(msg, data, target)

 if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"

end 

local mute_contact = data[tostring(target)]["mutes"]["mute_contact"]
 if mute_contact == "no" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _جهات الاتصال بالتأكيد تم فتحها_ ✔️'

else 
data[tostring(target)]["mutes"]["mute_contact"] = "no"
 save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم فتح جهات الاتصال_ ✔️'

end
end
---------------Mute Forward-------------------
function mute_forward(msg, data, target) 

if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"

end

local mute_forward = data[tostring(target)]["mutes"]["mute_forward"] 
if mute_forward == "yes" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _التوجيه بالتأكيد تم قفلها_ ✔️'

else
 data[tostring(target)]["mutes"]["mute_forward"] = "yes" 
save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم قفل التوجيه_ ✔️'

end
end

function unmute_forward(msg, data, target)

 if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"

end 

local mute_forward = data[tostring(target)]["mutes"]["mute_forward"]
 if mute_forward == "no" then
return '💢¦ _اهلا عزيزي_ \n💢¦ _التوجيه بالتأكيد تم فتحها_ ✔️'
else 
data[tostring(target)]["mutes"]["mute_forward"] = "no"
 save_data(_config.moderation.data, data)

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم فتح التوجيه_ ✔️'
end
end
---------------Mute Location-------------------
function mute_location(msg, data, target) 

if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"

end

local mute_location = data[tostring(target)]["mutes"]["mute_location"] 
if mute_location == "yes" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _الموقع بالتأكيد تم قفله_ ✔️'

else
 data[tostring(target)]["mutes"]["mute_location"] = "yes" 
save_data(_config.moderation.data, data)

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم قفل الموقع_ ✔️'

end
end

function unmute_location(msg, data, target)

 if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"

end 

local mute_location = data[tostring(target)]["mutes"]["mute_location"]
 if mute_location == "no" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _الموقع بالتأكيد تم فتحه_ ✔️'

else 
data[tostring(target)]["mutes"]["mute_location"] = "no"
 save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم فتح الموقع_ ✔️'

end
end
---------------Mute Document-------------------
function mute_document(msg, data, target) 

if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"

end

local mute_document = data[tostring(target)]["mutes"]["mute_document"] 
if mute_document == "yes" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _الملفات بالتأكيد تم قفلها_ ✔️'

else
 data[tostring(target)]["mutes"]["mute_document"] = "yes" 
save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم قفل الملفات_ ✔️'

end
end

function unmute_document(msg, data, target)

 if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"
end
 

local mute_document = data[tostring(target)]["mutes"]["mute_document"]
 if mute_document == "no" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _الملفات بالتأكيد تم فتحها_ ✔️'

else 
data[tostring(target)]["mutes"]["mute_document"] = "no"
 save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم فتح الملفات_ ✔️'

end
end
---------------Mute TgService-------------------
function mute_tgservice(msg, data, target) 

if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"

end

local mute_tgservice = data[tostring(target)]["mutes"]["mute_tgservice"] 
if mute_tgservice == "yes" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _الاشعارات بالتأكيد تم فتحها_ ✔️'

else
 data[tostring(target)]["mutes"]["mute_tgservice"] = "yes" 
save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم قفل الاشعارات_ ✔️'
end
end

function unmute_tgservice(msg, data, target)

 if not is_mod(msg) then
 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"
end

local mute_tgservice = data[tostring(target)]["mutes"]["mute_tgservice"]
 if mute_tgservice == "no" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _الاشعارات بالتأكيد تم فتحها_ ✔️'
else 
data[tostring(target)]["mutes"]["mute_tgservice"] = "no"
 save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _الاشعارات بالتأكيد تم فتحها_ ✔️'

end
end

---------------Mute Keyboard-------------------
function mute_keyboard(msg, data, target) 

if not is_mod(msg) then

 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"

end

local mute_keyboard = data[tostring(target)]["mutes"]["mute_keyboard"] 
if mute_keyboard == "yes" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _الكيبورد بالتأكيد تم قفله_ ✔️'

else
 data[tostring(target)]["mutes"]["mute_keyboard"] = "yes" 
save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم قفل الكيبورد_ ✔️'

end
end

function unmute_keyboard(msg, data, target)

 if not is_mod(msg) then
 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"
end

local mute_keyboard = data[tostring(target)]["mutes"]["mute_keyboard"]
 if mute_keyboard == "no" then

return '💢¦ _اهلا عزيزي_ \n💢¦ _الكيبورد بالتأكيد تم فتحه_ ✔️'
 
else 
data[tostring(target)]["mutes"]["mute_keyboard"] = "no"
 save_data(_config.moderation.data, data) 

return '💢¦ _اهلا عزيزي_ \n💢¦ _تم فتح الكيبورد_ ✔️'
 
end
end