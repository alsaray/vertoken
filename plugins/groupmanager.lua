--[[
by omar alsaray @blcon  \ @verxbot
اي استفسار او لديك مشكله تابع قناتي @verxbot 
او مراسلتي ع الخاص
تم تعريب االترمنال من قبل عمر السراي
]]-- groupmanager.lua by @alsaray
local function modadd(msg)

if not is_sudo(msg) then
return '💢¦ _أنـت لـسـت الـمـطـور _ ⚙️'
end
    local data = load_data(_config.moderation.data)
  if data[tostring(msg.to.id)] then
 return '💢¦ المجموعه بالتأكيد ✔️ تم تفعيلها'
end
local status = getChatAdministrators(msg.to.id).result
for k,v in pairs(status) do
if v.status == "creator" then
if v.user.username then
creator_id = v.user.id
user_name = '@'..check_markdown(v.user.username)
else
user_name = check_markdown(v.user.first_name)
end
end
end
-- create data array in moderation.json
data[tostring(msg.to.id)] = {
owners = {[tostring(creator_id)] = user_name},
mods ={},
banned ={},
is_silent_users ={},
filterlist ={},
replay ={},
whitelist ={},

settings = {
set_name = msg.to.title,
lock_link = 'yes',
lock_tag = 'no',
lock_spam = 'yes',
lock_edit = 'no',
lock_webpage = 'no',
lock_markdown = 'no',
flood = 'yes',
lock_bots = 'yes',
lock_pin = 'no',
lock_woring = 'no',
replay = 'no',
welcome = 'no',
lock_join = 'no',
lock_bots_inkick = 'no',
lock_id = 'no',
num_msg_max = '5',
},
   mutes = {
mute_forward = 'yes',
mute_audio = 'no',
mute_video = 'no',
mute_contact = 'yes',
mute_text = 'no',
mute_photo = 'no',
mute_gif = 'no',
mute_location = 'no',
mute_document = 'no',
mute_sticker = 'no',
mute_voice = 'no',
mute_tgservice = 'no',
mute_inline = 'no'
}
}
  save_data(_config.moderation.data, data)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(groups)][tostring(msg.to.id)] = msg.to.id
      save_data(_config.moderation.data, data)
if tonumber(msg.from.id) ~= tonumber(sudo_id) then
send_msg(sudo_id, '💢¦ تـم تـفـعـيـل الـمـجـمـوعـه ✔️\n💢¦ '..msg.to.title..'️\n💢¦ ايدي المجموعه : '..msg.to.id..'\n💢¦ بواسطة : '..msg.from.first_name)
end
     send_msg(msg.to.id, '💢¦ تـم تـفـعـيـل الـمـجـمـوعـه ✔️', msg.id,'md')
end

local function modrem(msg)
    -- superuser and admins only (because sudo are always has privilege)
      if not is_sudo(msg) then
return '💢¦ _أنـت لـسـت الـمـطـور _ ⚙️'
   end
    local data = load_data(_config.moderation.data)
    local receiver = msg.to.id
  if not data[tostring(msg.to.id)] then
 return '💢¦ المجموعه بالتأكيد ✔️ تم تعطيلها'
  end

  data[tostring(msg.to.id)] = nil
  save_data(_config.moderation.data, data)
     local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = nil
        save_data(_config.moderation.data, data)
      end data[tostring(groups)][tostring(msg.to.id)] = nil
      save_data(_config.moderation.data, data)
 return '💢¦ تـم تـعـطـيـل الـمـجـمـوعـه⚠️'

end

local function modlist(msg)
    local data = load_data(_config.moderation.data)
    local i = 1
  if not data[tostring(msg.to.id)] then
    return  "💢¦ _هذه المجموعه ليست من حمايتي ✔️_"
 end
  -- determine if table is empty
  if next(data[tostring(msg.to.id)]['mods']) == nil then --fix way
return  "💢¦ _لا يوجد ادمن في هذه المجموعه ✔️_"
end
   message = '💢¦ *قائمه الادمنيه :*\n'
  for k,v in pairs(data[tostring(msg.to.id)]['mods'])
do
    message = message ..i.. '- '..v..' [[' ..k.. ']] \n'
   i = i + 1
end
  return message
end

local function ownerlist(msg)
    local data = load_data(_config.moderation.data)
    local i = 1
  if not data[tostring(msg.to.id)] then
    return  "💢¦ _هذه المجموعه ليست من حمايتي ✔️_"
end
  -- determine if table is empty
  if next(data[tostring(msg.to.id)]['owners']) == nil then --fix way
return  "💢¦ _ لا يوجد هنا مدير ⚙️_"
end
   message = '💢¦ *قائمه المدراء :*\n'
  for k,v in pairs(data[tostring(msg.to.id)]['owners']) do
    message = message ..i.. '- '..v..' [[' ..k.. ']] \n'
   i = i + 1
end
  return message
end

local function filter_word(msg, word)
    local data = load_data(_config.moderation.data)
    if not data[tostring(msg.to.id)]['filterlist'] then
      data[tostring(msg.to.id)]['filterlist'] = {}
      save_data(_config.moderation.data, data)
    end
    if data[tostring(msg.to.id)]['filterlist'][(word)] then
 return  "💢¦ _ الكلمه_ *"..word.."* _هي بالتأكيد من قائمه المنع✔️_"
      end
    data[tostring(msg.to.id)]['filterlist'][(word)] = true
    save_data(_config.moderation.data, data)
 return  "💢¦ _ الكلمه_ *"..word.."* _تمت اضافتها الى قائمه المنع ✔️_"
    end

local function unfilter_word(msg, word)
    local data = load_data(_config.moderation.data)
    if not data[tostring(msg.to.id)]['filterlist'] then
      data[tostring(msg.to.id)]['filterlist'] = {}
      save_data(_config.moderation.data, data)
    end
    if data[tostring(msg.to.id)]['filterlist'][word] then
      data[tostring(msg.to.id)]['filterlist'][(word)] = nil
      save_data(_config.moderation.data, data)
return  "💢¦ _ الكلمه_ *"..word.."* _تم السماح بها ✔️_"
    else
      return  "💢¦ _ الكلمه_ *"..word.."* _هي بالتأكيد مسموح بها✔️_"
    end
  end



function group_settings(msg, target) 	
 local target = msg.to.id 
local data = load_data(_config.moderation.data)
if not is_mod(msg) then
 return "💢¦ _هذا الامر يخص الادمنيه فقط _ 🚶"
end
if data[tostring(target)] then 	
if data[tostring(target)]["settings"]["num_msg_max"] then 	
NUM_MSG_MAX = tonumber(data[tostring(target)]['settings']['num_msg_max'])
else 	
NUM_MSG_MAX = 5
end
end
local expire_date = ''
local expi = redis:ttl('ExpireDate:'..msg.to.id)
local day = math.floor(expi / 86400) + 1
if expi == -1 then
	expire_date = 'مفتوح🎖'
    elseif day == 1 then
	expire_date = 'يوم واحد' 
	elseif day == 2 then
   	expire_date = 'يومين'
	elseif day <= 10 then
   	expire_date = day..' ايام'
   	else
	expire_date = day..' يوم'
end
local settings = data[tostring(target)]["settings"] 
local mutes = data[tostring(target)]["mutes"] 

 text = "🗯¦` اعدادات الوسائط :`"
 .."\n💢¦ قفل المتحركه : "..mutes.mute_gif
 --.."\n💢¦ قفل الدردشه : "..mutes.mute_text
 .."\n💢¦ قفل الانلاين : "..mutes.mute_inline
 --.."\n💢¦ قفل الالعاب : "..mutes.mute_game
 .."\n💢¦ قفل الصور : "..mutes.mute_photo
 .."\n💢¦ قفل الفيديو : "..mutes.mute_video
 .."\n💢¦ قفل البصمات : "..mutes.mute_audio
 .."\n\n💢¦ قفل الصوت : "..mutes.mute_voice
 .."\n💢¦ قفل الملصقات : "..mutes.mute_sticker
 .."\n💢¦ قفل الجهات : "..mutes.mute_contact
 .."\n💢¦ قفل التوجيه : "..mutes.mute_forward
-- .."\n💢¦ قفل الموقع : "..mutes.mute_location
-- .."\n💢¦ قفل الملفات : "..mutes.mute_document
 .."\n💢¦ قفل الاشعارات : "..mutes.mute_tgservice
-- .."\n💢¦ قفل الكيبورد : "..mutes.mute_keyboard

.."\n\n🗯¦` اعدادات المجموعه :` "
 .."\n💢¦ قفل التعديل : "..settings.lock_edit
 .."\n💢¦ قفل الروابط : "..settings.lock_link
 .."\n💢¦ قفل الاضافه : "..settings.lock_join
 .."\n💢¦ قفل التاك : "..settings.lock_tag
 .."\n💢¦ قفل الكلايش : "..settings.lock_spam
-- .."\n💢¦ قفل الويب : "..settings.lock_webpage
 .."\n💢¦ قفل الماركدون : "..settings.lock_markdown
 .."\n💢¦ قفل التثبيت : "..settings.lock_pin
 .."\n💢¦ قفل الايدي : "..settings.lock_id
 .."\n💢¦ قفل البوتات : "..settings.lock_bots
 .."\n💢¦ قفل  البوتات بالطرد : "..settings.lock_bots_inkick
  .."\n💢¦ قفل التكرار : "..settings.flood
 .."\n💢¦ عدد التكرار : "..NUM_MSG_MAX
.."\n\n🗯¦` اعدادات اخرى : `"
.."\n💢¦ تشغيل الترحيب : "..settings.welcome
.."\n💢¦ تشغيل الردود : "..settings.replay
.."\n💢¦ تشغيل التحذير : "..settings.lock_woring
.." \n\n💢¦ الاشتراك :` "..expire_date.."`"
..'\n\n💢¦ مـطـور الـبـوت : '..sudouser..'\n'



text = string.gsub(text, 'yes', '✔️')
text = string.gsub(text, 'no', '🚫')
return text
end

local function VerBot(msg, matches)

local data = load_data(_config.moderation.data)
local target = msg.to.id
----------------Begin Msg Matches--------------
if msg.to.type == 'private' then return end

if matches[1] == "تفعيل" and is_sudo(msg) then
return modadd(msg)
end

if matches[1] == "تعطيل" and is_sudo(msg) then
return modrem(msg)
 end
 
 if not data[tostring(msg.to.id)] then return end
 
if matches[1] == "الاداريين" and is_mod(msg) then
return ownerlist(msg)
   end
if matches[1] == "قائمه المنع" and is_mod(msg) then
return filter_list(msg)
   end
if matches[1] == "الادمنيه" and is_mod(msg) then
return modlist(msg)
   end
if matches[1] == "الاعضاء المميزين" and is_mod(msg) then
return whitelist(msg.to.id)
   end

if matches[1] == "ايدي" then
local lock_id = data[tostring(msg.to.id)]["settings"]["lock_id"] 
 if lock_id == 'no' then
   if not matches[2] and not msg.reply_to_message then
local status = getUserProfilePhotos(msg.from.id, 0, 0)
local rank
if is_sudo(msg) then
rank = 'المطور مالتي 😻'
elseif is_owner(msg) then
rank = 'مدير المجموعه 😽'
elseif is_mod(msg) then
rank = 'ادمن في البوت 😺'
elseif  is_whitelist(msg.from.id, msg.to.id) then
rank = 'عضو مميز 🎖'
else
rank = 'مجرد عضو 😼'
end
if msg.from.username then
userxn = "@"..(msg.from.username or "---")
else
userxn = "لا يتوفر"
end

local msgs = tonumber(redis:get('msgs:'..msg.from.id..':'..msg.to.id) or 0)
if status.result.total_count ~= 0 then
	sendPhotoById(msg.to.id, status.result.photos[1][1].file_id, msg.id, '💢¦ اسمك : '..namecut(msg.from.first_name)..'\n💢¦ معرفك : '..userxn..'\n💢¦ ايديك : '..msg.from.id..'\n💢¦ رتبتك : '..rank..'\n💬¦ رسائلك : ['..msgs..'] رسالة 💯\n')
	else
return '💢¦لا توجد صورة في بروفايلك !!! \n💢¦ اسمك : '..namecut(msg.from.first_name)..'\n💢¦ معرفك : '..userxn..'\n💢¦ ايديك : '..msg.from.id..'\n💢¦ رتبتك : '..rank..'\n💬¦ رسائلك : ['..msgs..'] رسالة 💯\n'
end
   elseif not msg.reply_to_message and string.match(matches[2], '@[%a%d_]')  and matches[2] ~= "التوجيه" and is_mod(msg) then
    local status = resolve_username(matches[2])
		if not status.result then
			return '💢¦لا يوجد عضو بهذا المعرف ...'
		end
     return "`"..status.information.id.."`"
   elseif matches[2] == "التوجيه" and msg.reply_to_message and msg.reply.fwd_from then
     return "`"..msg.reply.fwd_from.id.."`"
     elseif msg.reply_to_message and not msg.reply.fwd_from then
           return "`"..msg.reply.id.."`"
   end
end
end
if matches[1] == "تثبيت" and is_mod(msg) and msg.reply_id then
local lock_pin = data[tostring(msg.to.id)]["settings"]["lock_pin"] 
 if lock_pin == 'yes' then
if is_owner(msg) then
    data[tostring(msg.to.id)]['pin'] = msg.reply_id
	  save_data(_config.moderation.data, data)
pinChatMessage(msg.to.id, msg.reply_id)
return "💢¦ _اهلا عزيزي_\n💢¦ _ تم تثبيت الرساله_ ✔️"
elseif not is_owner(msg) then
   return "💢¦ للمدراء فقط 🎖"
 end
 elseif lock_pin == 'no' then
    data[tostring(msg.to.id)]['pin'] = msg.reply_id
	  save_data(_config.moderation.data, data)
pinChatMessage(msg.to.id, msg.reply_id)
return "💢¦ _اهلا عزيزي_\n💢¦ _ تم تثبيت الرساله_ ✔️"
end
end
if matches[1] == 'الغاء التثبيت' and is_mod(msg) then
local lock_pin = data[tostring(msg.to.id)]["settings"]["lock_pin"] 
 if lock_pin == 'yes' then
if is_owner(msg) then
unpinChatMessage(msg.to.id)
return "💢¦ _اهلا عزيزي_\n💢¦ _ تم الغاء تثبيت الرساله_ ✔️"
elseif not is_owner(msg) then
   return "💢¦ للمدراء فقط 🎖"
 end
 elseif lock_pin == 'no' then
unpinChatMessage(msg.to.id)
return "💢¦ _اهلا عزيزي_\n💢¦ _ تم الغاء تثبيت الرساله_ ✔️"
end
end

if matches[1] == 'الحمايه' then
return group_settings(msg, target)
end
if matches[1] == "رفع المدير" and is_sudo(msg) then
   if not matches[2] and msg.reply_to_message then
	if msg.reply.username then
	username = "@"..check_markdown(msg.reply.username)
    else
	username = escape_markdown(msg.reply.first_name)
   end
   if tonumber(msg.reply.id) == tonumber(our_id) then return end
   if data[tostring(msg.to.id)]['owners'][tostring(msg.reply.id)] then
    return "💢¦ العضو :  "..username.."\n💢¦ الايدي :  ["..msg.reply.id.."]\n💢¦ انه بالتاكيد مدير"
    else
  data[tostring(msg.to.id)]['owners'][tostring(msg.reply.id)] = username
    save_data(_config.moderation.data, data)
    return "💢¦ العضو :  "..username.."\n💢¦ الايدي :  ["..msg.reply.id.."] \n💢¦ تم ترقيتة ليصبح مدير"
      end
	  elseif matches[2] and matches[2]:match('^%d+') then
	        if tonumber(matches[2]) == tonumber(our_id) then return end
  if not getUser(matches[2]).result then
   return "💢¦ لا يوجد عضو بهذا المعرف."
    end
	  local user_name = '@'..check_markdown(getUser(matches[2]).information.username)
	  if not user_name then
		user_name = escape_markdown(getUser(matches[2]).information.first_name)
	  end
	  if data[tostring(msg.to.id)]['owners'][tostring(matches[2])] then
    return "💢¦ العضو :  "..user_name.."\n💢¦ الايدي :  ["..matches[2].."]\n💢¦ انه بالتاكيد مدير"
    else
  data[tostring(msg.to.id)]['owners'][tostring(matches[2])] = user_name
    save_data(_config.moderation.data, data)
    return "💢¦ العضو :  "..user_name.."\n💢¦ الايدي :  ["..matches[2].."] \n💢¦ تم ترقيتة ليصبح مدير"
   end
  elseif matches[2] and string.match(matches[2], '@[%a%d_]')  then
   local status = resolve_username(matches[2]).information
   if tonumber(status.id) == tonumber(our_id) then return end
  if not resolve_username(matches[2]).result then
   return "💢¦ لا يوجد عضو بهذا المعرف."
    end
   if data[tostring(msg.to.id)]['owners'][tostring(status.id)] then
    return "💢¦ العضو :  @"..check_markdown(status.username).."\n💢¦ الايدي :  ["..status.id.."]\n💢¦ انه بالتاكيد مدير"
    else
  data[tostring(msg.to.id)]['owners'][tostring(status.id)] = check_markdown(status.username)
    save_data(_config.moderation.data, data)
    return "💢¦ العضو :  @"..check_markdown(status.username).."\n💢¦ الايدي :  ["..status.id.."] \n💢¦ تم ترقيتة ليصبح مدير"
   end
end
end
if matches[1] == "تنزيل المدير" and is_sudo(msg) then
      if not matches[2] and msg.reply_to_message then
	if msg.reply.username then
	username = "@"..check_markdown(msg.reply.username)
    else
	username = escape_markdown(msg.reply.first_name)
    end
   if tonumber(msg.reply.id) == tonumber(our_id) then return end
   if not data[tostring(msg.to.id)]['owners'][tostring(msg.reply.id)] then
    return "💢¦ العضو :  "..username.."\n💢¦ الايدي :  ["..msg.reply.id.."]\n💢¦ انه بالتاكيد تم تنزيله من الادارة "
    else
  data[tostring(msg.to.id)]['owners'][tostring(msg.reply.id)] = nil
    save_data(_config.moderation.data, data)
    return "💢¦ العضو :  "..username.."\n💢¦ الايدي :  ["..msg.reply.id.."]\n💢¦ تم تنزيله من الادارة "
      end
	  elseif matches[2] and matches[2]:match('^%d+') then
	        if tonumber(matches[2]) == tonumber(our_id) then return end
  if not getUser(matches[2]).result then
   return "💢¦ لا يوجد عضو بهذا المعرف."
    end
	  local user_name = '@'..check_markdown(getUser(matches[2]).information.username)
	  if not user_name then
		user_name = escape_markdown(getUser(matches[2]).information.first_name)
	  end
	  if not data[tostring(msg.to.id)]['owners'][tostring(matches[2])] then
    return "💢¦ العضو :  "..user_name.."\n💢¦ الايدي :  ["..matches[2].."]\n💢¦ انه بالتاكيد تم تنزيله من الادارة "
    else
  data[tostring(msg.to.id)]['owners'][tostring(matches[2])] = nil
    save_data(_config.moderation.data, data)
    return "💢¦ العضو :  "..user_name.."\n💢¦ الايدي :  ["..matches[2].."]\n💢¦ تم تنزيله من الادارة "
      end
   elseif matches[2] and string.match(matches[2], '@[%a%d_]')  then
       local status = resolve_username(matches[2]).information
   if tonumber(status.id) == tonumber(our_id) then return end
  if not resolve_username(matches[2]).result then
   return "💢¦ لا يوجد عضو بهذا المعرف."
    end
   if not data[tostring(msg.to.id)]['owners'][tostring(status.id)] then
    return "💢¦ العضو :  @"..check_markdown(status.username).."\n💢¦ الايدي :  ["..status.id.."]\n💢¦ انه بالتاكيد تم تنزيله من الادارة "
    else
  data[tostring(msg.to.id)]['owners'][tostring(status.id)] = nil
    save_data(_config.moderation.data, data)
    return "💢¦ العضو :  @"..check_markdown(status.username).."\n💢¦ الايدي :  ["..status.id.."]\n💢¦ تم تنزيله من الادارة "
      end
end
end
if matches[1] == "رفع ادمن" and is_owner(msg) then
   if not matches[2] and msg.reply_to_message then
    	  if tonumber(msg.reply.id) == tonumber(our_id) then return end

	if msg.reply.username then
 
	username = "@"..check_markdown(msg.reply.username)
    else
	username = escape_markdown(msg.reply.first_name)
    end
   if data[tostring(msg.to.id)]['mods'][tostring(msg.reply.id)] then
    return "💢¦ العضو :  "..username.."\n💢¦ الايدي :  ["..msg.reply.id.."]\n💢¦ انه بالتاكيد ادمن "
    else
  data[tostring(msg.to.id)]['mods'][tostring(msg.reply.id)] = username
    save_data(_config.moderation.data, data)
    return "💢¦ العضو :  "..username.."\n💢¦ الايدي :  ["..msg.reply.id.."]\n💢¦ تم رفع ادمن "
      end
	  elseif matches[2] and matches[2]:match('^%d+') then
	     if tonumber(matches[2]) == tonumber(our_id) then return end
  if not getUser(matches[2]).result then
   return "💢¦ لا يوجد عضو بهذا المعرف."
    end
	  local user_name = '@'..check_markdown(getUser(matches[2]).information.username)
	  if not user_name then
		user_name = escape_markdown(getUser(matches[2]).information.first_name)
	  end
	  if data[tostring(msg.to.id)]['mods'][tostring(matches[2])] then
    return "💢¦ العضو :  "..user_name.."\n💢¦ الايدي :  ["..matches[2].."]\n💢¦ انه بالتاكيد ادمن "
    else
  data[tostring(msg.to.id)]['mods'][tostring(matches[2])] = user_name
    save_data(_config.moderation.data, data)
    return "💢¦ العضو :  "..user_name.."\n💢¦ الايدي :  ["..matches[2].."]\n💢¦ تم رفع ادمن "
   end
  elseif matches[2] and string.match(matches[2], '@[%a%d_]')  then
      local status = resolve_username(matches[2]).information
   if tonumber(status.id) == tonumber(our_id) then return end
  if not resolve_username(matches[2]).result then
   return "💢¦ لا يوجد عضو بهذا المعرف."
    end
   if data[tostring(msg.to.id)]['mods'][tostring(user_id)] then
    return "💢¦ العضو :  @"..check_markdown(status.username).."\n💢¦ الايدي :  ["..status.id.."]\n💢¦ انه بالتاكيد ادمن "
    else
  data[tostring(msg.to.id)]['mods'][tostring(status.id)] = check_markdown(status.username)
    save_data(_config.moderation.data, data)
    return "💢¦ العضو :  @"..check_markdown(status.username).."\n💢¦ الايدي :  ["..status.id.."]\n💢¦ تم رفع ادمن "
   end
end
end
if matches[1] == "تنزيل ادمن" and is_owner(msg) then
      if not matches[2] and msg.reply_to_message then
         if tonumber(msg.reply.id) == tonumber(our_id) then return end

	if msg.reply.username then
	username = "@"..check_markdown(msg.reply.username)
    else
	username = escape_markdown(msg.reply.first_name)
    end
   if not data[tostring(msg.to.id)]['mods'][tostring(msg.reply.id)] then
    return "💢¦ العضو :  "..username.."\n💢¦ الايدي :  ["..msg.reply.id.."]\n💢¦ انه بالتاكيد تم تنزيله من الادمنيه "
    else
  data[tostring(msg.to.id)]['mods'][tostring(msg.reply.id)] = nil
    save_data(_config.moderation.data, data)
    return "💢¦ العضو :  "..username.."\n💢¦ الايدي :  ["..msg.reply.id.."]\n💢¦ تم تنزيله من الادمنيه "
      end
	  elseif matches[2] and matches[2]:match('^%d+') then
	     if tonumber(matches[2]) == tonumber(our_id) then return end
  if not getUser(matches[2]).result then
   return "💢¦ لا يوجد عضو بهذا المعرف."
    end
	  local user_name = '@'..check_markdown(getUser(matches[2]).information.username)
	  if not user_name then
		user_name = escape_markdown(getUser(matches[2]).information.first_name)
	  end
	  if not data[tostring(msg.to.id)]['mods'][tostring(matches[2])] then
    return "💢¦ العضو :  "..user_name.."\n💢¦ الايدي :  ["..matches[2].."]\n💢¦ انه بالتاكيد تم تنزيله من الادمنيه "
    else
  data[tostring(msg.to.id)]['mods'][tostring(matches[2])] = user_name
    save_data(_config.moderation.data, data)
    return "💢¦ العضو :  "..user_name.."\n💢¦ الايدي :  ["..matches[2].."]\n💢¦ تم تنزيله من الادمنيه "
      end
   elseif matches[2] and string.match(matches[2], '@[%a%d_]')  then
       local status = resolve_username(matches[2]).information
   if tonumber(status.id) == tonumber(our_id) then return end

  if not resolve_username(matches[2]).result then
   return "💢¦ لا يوجد عضو بهذا المعرف."
    end
   if not data[tostring(msg.to.id)]['mods'][tostring(status.id)] then
    return "💢¦ العضو :  @"..check_markdown(status.username).."\n💢¦ الايدي :  ["..status.id.."] \n💢¦ انه بالتاكيد تم تنزيله من الادمنيه "
    else
  data[tostring(msg.to.id)]['mods'][tostring(status.id)] = nil
    save_data(_config.moderation.data, data)
    return "💢¦ العضو :  @"..check_markdown(status.username).."\n💢¦ الايدي :  ["..status.id.."]\n💢¦ تم تنزيله من الادمنيه "
      end
end
end
if matches[1] == "رفع عضو مميز"  and is_mod(msg) then
   if not matches[2] and msg.reply_to_message then
   if tonumber(msg.reply.id) == tonumber(our_id) then return end
	if msg.reply.username then
	username = "@"..check_markdown(msg.reply.username)
    else
	username = escape_markdown(msg.reply.first_name)
    end
   if data[tostring(msg.to.id)]['whitelist'][tostring(msg.reply.id)] then
    return "💢¦ العضو :  "..username.."\n💢¦ الايدي :  ["..msg.reply.id.."]\n💢¦ انه بالتاكيد تم رفعه عضو مميز "
    else
  data[tostring(msg.to.id)]['whitelist'][tostring(msg.reply.id)] = username
    save_data(_config.moderation.data, data)
    return "💢¦ العضو :  "..username.."\n💢¦ الايدي :  ["..msg.reply.id.."] \n💢¦ تم رفع عضو مميز "
      end
	  elseif matches[2] and matches[2]:match('^%d+') then
	      if tonumber(matches[2]) == tonumber(our_id) then return end
  if not getUser(matches[2]).result then
   return "💢¦ لا يوجد عضو بهذا المعرف."
    end
	  local user_name = '@'..check_markdown(getUser(matches[2]).information.username)
	  if not user_name then
		user_name = escape_markdown(getUser(matches[2]).information.first_name)
	  end
	  if data[tostring(msg.to.id)]['whitelist'][tostring(matches[2])] then
    return "💢¦ العضو :  "..user_name.."\n💢¦ الايدي :  "..matches[2].."\n💢¦ انه بالتاكيد تم رفعه عضو مميز "
    else
  data[tostring(msg.to.id)]['whitelist'][tostring(matches[2])] = user_name
    save_data(_config.moderation.data, data)
    return "💢¦ العضو :  "..user_name.."\n💢¦ الايدي :  "..matches[2].."\n💢¦ تم رفع عضو مميز "
   end
  elseif matches[2] and string.match(matches[2], '@[%a%d_]')  then
      local status = resolve_username(matches[2]).information
   if tonumber(status.id) == tonumber(our_id) then return end
  if not resolve_username(matches[2]).result then
   return "💢¦ لا يوجد عضو بهذا المعرف."
    end
   if data[tostring(msg.to.id)]['whitelist'][tostring(status.id)] then
    return "💢¦ العضو :  @"..check_markdown(status.username).."\n💢¦ الايدي :  ["..status.id.."] \n💢¦ انه بالتاكيد تم رفعه عضو مميز "
    else
  data[tostring(msg.to.id)]['whitelist'][tostring(status.id)] = check_markdown(status.username)
    save_data(_config.moderation.data, data)
    return "💢¦ العضو :  @"..check_markdown(status.username).."\n💢¦ الايدي :  ["..status.id.."] \n💢¦ تم رفع عضو مميز "
   end
end
end
if matches[1] == "تنزيل عضو مميز" and is_mod(msg) then
      if not matches[2] and msg.reply_to_message then
  if tonumber(msg.reply.id) == tonumber(our_id) then return end

	if msg.reply.username then
	username = "@"..check_markdown(msg.reply.username)
    else
	username = escape_markdown(msg.reply.first_name)
    end
   if not data[tostring(msg.to.id)]['whitelist'][tostring(msg.reply.id)] then
    return "💢¦ العضو :  "..username.."\n💢¦ الايدي :  ["..msg.reply.id.."] \n💢¦ انه بالتاكيد تم تنزيله عضو مميز "
    else
  data[tostring(msg.to.id)]['whitelist'][tostring(msg.reply.id)] = nil
    save_data(_config.moderation.data, data)
    return "💢¦ العضو :  "..username.."\n💢¦ الايدي :  ["..msg.reply.id.."] \n💢 تم تنزيل عضو مميز "
      end
	  elseif matches[2] and matches[2]:match('^%d+') then
	     if tonumber(matches[2]) == tonumber(our_id) then return end
  if not getUser(matches[2]).result then
   return "💢¦ لا يوجد عضو بهذا المعرف."
    end
	  local user_name = '@'..check_markdown(getUser(matches[2]).information.username)
	  if not user_name then
		user_name = escape_markdown(getUser(matches[2]).information.first_name)
	  end
	  if not data[tostring(msg.to.id)]['whitelist'][tostring(matches[2])] then
    return "💢¦ العضو :  "..user_name.."\n💢¦ الايدي :  "..matches[2].."\n💢¦ انه بالتاكيد تم تنزيله الاعضاء المميزين "
    else
  data[tostring(msg.to.id)]['whitelist'][tostring(matches[2])] = nil
    save_data(_config.moderation.data, data)
    return "💢¦ العضو :  "..user_name.."\n💢¦ الايدي :  "..matches[2].." \n💢¦ تم تنزيل الاعضاء المميزين "
      end
   elseif matches[2] and string.match(matches[2], '@[%a%d_]')  then
       local status = resolve_username(matches[2]).information
   if tonumber(status.id) == tonumber(our_id) then return end
  if not resolve_username(matches[2]).result then
   return "💢¦ لا يوجد عضو بهذا المعرف."
    end
   if not data[tostring(msg.to.id)]['whitelist'][tostring(status.id)] then
    return "💢¦ العضو :  @"..check_markdown(status.username).."\n💢¦ الايدي :  ["..status.id.."] \n💢¦ انه بالتاكيد تم تنزيله الاعضاء المميزين "
    else
  data[tostring(msg.to.id)]['whitelist'][tostring(status.id)] = nil
    save_data(_config.moderation.data, data)
    return "💢¦ العضو :  @"..check_markdown(status.username).."\n💢¦ الايدي :  ["..status.id.."] \n💢¦ تم تنزيل الاعضاء المميزين "
      end
end
end
if matches[1]:lower() == "قفل" and is_mod(msg) then
if matches[2] == "الروابط" then
return lock_link(msg, data, target)
end
if matches[2] == "التاك" then
return lock_tag(msg, data, target)
end
if matches[2] == "التعديل" then
return lock_edit(msg, data, target)
end
if matches[2] == "الكلايش" then
return lock_spam(msg, data, target)
end
if matches[2] == "التكرار" then
return lock_flood(msg, data, target)
end
if matches[2] == "البوتات" then
return lock_bots(msg, data, target)
end
if matches[2] == "البوتات بالطرد" then
return lock_bots_inkick(msg, data, target)
end
if matches[2] == "الماركدون" then
return lock_markdown(msg, data, target)
end
if matches[2] == "الويب" then
return lock_webpage(msg, data, target)
end
if matches[2] == "التثبيت" and is_owner(msg) then
return lock_pin(msg, data, target)
end
if matches[2] == "الاضافه" then
return lock_join(msg, data, target)
end
end
if matches[1]:lower() == "فتح" and is_mod(msg) then
if matches[2] == "الروابط" then
return unlock_link(msg, data, target)
end
if matches[2] == "التاك" then
return unlock_tag(msg, data, target)
end
if matches[2] == "التعديل" then
return unlock_edit(msg, data, target)
end
if matches[2] == "الكلايش" then
return unlock_spam(msg, data, target)
end
if matches[2] == "التكرار" then
return unlock_flood(msg, data, target)
end
if matches[2] == "البوتات" then
return unlock_bots(msg, data, target)
end
if matches[2] == "البوتات بالطرد" then
return unlock_bots_inkick(msg, data, target)
end
if matches[2] == "الماركدون" then
return unlock_markdown(msg, data, target)
end
if matches[2] == "الويب" then
return unlock_webpage(msg, data, target)
end
if matches[2] == "التثبيت" and is_owner(msg) then
return unlock_pin(msg, data, target)
end
if matches[2] == "الاضافه" then
return unlock_join(msg, data, target)
end
end
if matches[1]:lower() == "قفل" and is_mod(msg) then
if matches[2] == "المتحركه" then
return mute_gif(msg, data, target)
end
if matches[2] == "الدردشه" then
return mute_text(msg ,data, target)
end
if matches[2] == "الصور" then
return mute_photo(msg ,data, target)
end
if matches[2] == "الفيديو" then
return mute_video(msg ,data, target)
end
if matches[2] == "الصوت" then
return mute_audio(msg ,data, target)
end
if matches[2] == "البصمات" then
return mute_voice(msg ,data, target)
end
if matches[2] == "الملصقات" then
return mute_sticker(msg ,data, target)
end
if matches[2] == "الجهات" then
return mute_contact(msg ,data, target)
end
if matches[2] == "التوجيه" then
return mute_forward(msg ,data, target)
end
if matches[2] == "الموقع" then
return mute_location(msg ,data, target)
end
if matches[2] == "الملفات" then
return mute_document(msg ,data, target)
end
if matches[2] == "الاشعارات" then
return mute_tgservice(msg ,data, target)
end
if matches[2] == "الانلاين" then
return mute_inline(msg ,data, target)
end
if matches[2] == 'الكل' then
    local close_all ={
 mute_gif(msg, data, target),
 mute_photo(msg ,data, target),
 mute_audio(msg ,data, target),
 mute_voice(msg ,data, target),
 mute_sticker(msg ,data, target),
 mute_forward(msg ,data, target),
 mute_contact(msg ,data, target),
 mute_location(msg ,data, target),
 mute_document(msg ,data, target),
 mute_inline(msg ,data, target),
 lock_link(msg, data, target),
 lock_tag(msg, data, target),
 lock_mention(msg, data, target),
 lock_edit(msg, data, target),
 lock_spam(msg, data, target),
 lock_bots(msg, data, target),
 lock_webpage(msg, data, target),
 mute_video(msg ,data, target),
   }
  return '💢¦ _اهلا عزيزي_ \n💢¦ _تم قفل الكل _ ✔️',close_all
end
end
if matches[1]:lower() == "فتح" and is_mod(msg) then
if matches[2] == "المتحركه" then
return unmute_gif(msg, data, target)
end
if matches[2] == "الدردشه" then
return unmute_text(msg, data, target)
end
if matches[2] == "الصور" then
return unmute_photo(msg ,data, target)
end
if matches[2] == "الفيديو" then
return unmute_video(msg ,data, target)
end
if matches[2] == "الصوت" then
return unmute_audio(msg ,data, target)
end
if matches[2] == "البصمات" then
return unmute_voice(msg ,data, target)
end
if matches[2] == "الملصقات" then
return unmute_sticker(msg ,data, target)
end
if matches[2] == "الجهات" then
return unmute_contact(msg ,data, target)
end
if matches[2] == "التوجيه" then
return unmute_forward(msg ,data, target)
end
if matches[2] == "الموقع" then
return unmute_location(msg ,data, target)
end
if matches[2] == "الملفات" then
return unmute_document(msg ,data, target)
end
if matches[2] == "الاشعارات" then
return unmute_tgservice(msg ,data, target)
end
if matches[2] == "الانلاين" then
return unmute_inline(msg ,data, target)
end
 if matches[2] == 'الكل' then
    local open_all ={
 unmute_gif(msg, data, target),
 unmute_photo(msg ,data, target),
 unmute_audio(msg ,data, target),
 unmute_voice(msg ,data, target),
 unmute_sticker(msg ,data, target),
 unmute_forward(msg ,data, target),
 unmute_contact(msg ,data, target),
 unmute_location(msg ,data, target),
 unmute_document(msg ,data, target),
 unlock_link(msg, data, target),
 unlock_tag(msg, data, target),
 unlock_mention(msg, data, target),
 unlock_edit(msg, data, target),
 unlock_spam(msg, data, target),
 unlock_bots(msg, data, target),
 unlock_webpage(msg, data, target),
 unmute_video(msg ,data, target),
 unmute_inline(msg ,data, target)
    }
 
return '💢¦ _اهلا عزيزي_ \n💢¦ _تم فتح الكل _ ✔️',open_all
end
end
  if matches[1] == 'منع' and matches[2] and is_mod(msg) then
    return filter_word(msg, matches[2])
  end
  if matches[1] == 'الغاء منع' and matches[2] and is_mod(msg) then
    return unfilter_word(msg, matches[2])
  end
  if matches[1] == 'تغيير الرابط' and is_mod(msg) then
  local administration = load_data(_config.moderation.data)
  local link = exportChatInviteLink(msg.to.id)
	if not link then
		return "*البوت ليس منشئ المجموعة قم بأضافة الرابط بأرسال* [ ضع رابط ]"
	else
		administration[tostring(msg.to.id)]['settings']['linkgp'] = link.result
		save_data(_config.moderation.data, administration)
		return "*💢¦ _شكرأ لك 😻_\n💢¦ _تم حفظ الرابط بنجاح _✔️ *"
	end
   end
		if matches[1] == 'ضع رابط' and is_owner(msg) then
		data[tostring(target)]['settings']['linkgp'] = 'waiting'
			save_data(_config.moderation.data, data)
return "💢¦ _اهلا عزيزي_\n💢¦ _رجائا ارسل الرابط الآن _🔃"
	   end
		if msg.text then
   local is_link = msg.text:match("^([https?://w]*.?telegram.me/joinchat/%S+)$") or msg.text:match("^([https?://w]*.?t.me/joinchat/%S+)$")
			if is_link and data[tostring(target)]['settings']['linkgp'] == 'waiting' and is_owner(msg) then
				data[tostring(target)]['settings']['linkgp'] = msg.text
				save_data(_config.moderation.data, data)
return "💢¦ _شكرأ لك 😻_\n💢¦ _تم حفظ الرابط بنجاح _✔️"
       end
		end
    if matches[1] == 'الرابط' and is_mod(msg) then
      local linkgp = data[tostring(target)]['settings']['linkgp']
      if not linkgp then
return "💢¦ _اوه 🙀 لا يوجد هنا رابط_\n💢¦ _رجائا اكتب [ضع رابط]_🔃"
      end
      return "💢¦ رابط المجموعة  :\n💢¦ اضغط هنا 👇🏿\n💢¦ـ[{ "..escape_markdown(msg.to.title).." }]("..check_markdown(linkgp)..")"
         
     end
  if matches[1] == "ضع القوانين" and matches[2] and is_mod(msg) then
    data[tostring(target)]['rules'] = matches[2]
	  save_data(_config.moderation.data, data)
return '💢¦ _اهلا عزيزي_\n💢¦ _تم حفظ القوانين بنجاح_✔️\n💢¦ _اكتب [ القوانين ] لعرضها 💬_'
  end
  if matches[1] == "القوانين" then
 if not data[tostring(target)]['rules'] then
     rules = "💢¦ _اهلا عزيزي_ 👋🏻 _القوانين كلاتي_ 👇🏻\n💢¦ _ممنوع نشر الروابط_ \n💢¦ _ممنوع التكلم او نشر صور اباحيه_ \n💢¦ _ممنوع  اعاده توجيه_ \n💢¦ _ممنوع التكلم بلطائفه_ \n💢¦ _الرجاء احترام المدراء والادمنيه _😅\n"
        else
     rules =  "*💢¦القوانين :*\n"..escape_markdown(data[tostring(target)]['rules'])
      end
    return rules
  end

  if matches[1]:lower() == 'ضع تكرار' and is_mod(msg) then
			if tonumber(matches[2]) < 1 or tonumber(matches[2]) > 50 then
				return "💢¦ _حدود التكرار ,  يجب ان تكون ما بين _ *[2-50]*"
      end
			local flood_max = matches[2]
			data[tostring(msg.to.id)]['settings']['num_msg_max'] = flood_max
			save_data(_config.moderation.data, data)
    return "💢¦_ تم وضع التكرار :_ *[ "..matches[2].." ]*"
       end

		if matches[1]:lower() == 'مسح' and is_owner(msg) then
			if matches[2] == 'الادمنيه' then
				if next(data[tostring(msg.to.id)]['mods']) == nil then
return "💢¦ _اوه ☢ هنالك خطأ_ 🚸\n💢¦ _عذرا لا يوجد ادمنيه ليتم مسحهم_ ✔️"
            end
				for k,v in pairs(data[tostring(msg.to.id)]['mods']) do
					data[tostring(msg.to.id)]['mods'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
return "💢¦ _اهلا عزيزي_ \n💢¦ _تم حذف الادمنيه بنجاح_ ✔️"
         end
			if matches[2] == 'قائمه المنع' then
				if next(data[tostring(msg.to.id)]['filterlist']) == nil then
					return "💢¦ _عذرا لا توجد كلمات ممنوعه ليتم حذفها_ ✔️"
				end
				for k,v in pairs(data[tostring(msg.to.id)]['filterlist']) do
					data[tostring(msg.to.id)]['filterlist'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
				return "💢¦ _اهلا عزيزي_ \n💢¦ _تم حذف الكلمات الممنوعه  ✔️"
			end
			if matches[2] == 'القوانين' then
				if not data[tostring(msg.to.id)]['rules'] then
return "💢¦ _اوه ☢ هنالك خطأ_ 🚸\n💢¦ _عذرا لا يوجد قوانين ليتم مسحه_ ✔️"
				end
					data[tostring(msg.to.id)]['rules'] = nil
					save_data(_config.moderation.data, data)
return "💢¦ _اهلا عزيزي_ \n💢¦ _تم حذف القوانين بنجاح_ ✔️"
       end
			if matches[2] == 'الترحيب' then
				if not data[tostring(msg.to.id)]['setwelcome'] then
return "💢¦ _اوه ☢ هنالك خطأ_ 🚸\n💢¦ _عذرا لا يوجد ترحيب ليتم مسحه_ ✔️"
				end
					data[tostring(msg.to.id)]['setwelcome'] = nil
					save_data(_config.moderation.data, data)
return "💢¦ _اهلا عزيزي_ \n💢¦ _تم حذف الترحيب بنجاح_ ✔️"
       end
			if matches[2] == 'الوصف' then
        if msg.to.type == "group" then
				if not data[tostring(msg.to.id)]['about'] then
return "💢¦ _عذرا لا يوجد وصف ليتم مسحه_ ✔️"
				end
					data[tostring(msg.to.id)]['about'] = nil
					save_data(_config.moderation.data, data)
        elseif msg.to.type == "supergroup" then
   setChatDescription(msg.to.id, "")
             end
return "💢¦ _اهلا عزيزي_ \n💢¦ _تم حذف الوصف بنجاح_ ✔️"
		   	end
        end
		if matches[1]:lower() == 'مسح' and is_sudo(msg) then
			if matches[2] == 'الاداريين' then
				if next(data[tostring(msg.to.id)]['owners']) == nil then
return "💢¦ _عذرا لا يوجد مدراء ليتم مسحهم_ ✔️"
				end
				for k,v in pairs(data[tostring(msg.to.id)]['owners']) do
					data[tostring(msg.to.id)]['owners'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
return "💢¦ _اهلا عزيزي_ \n💢¦ _تم حذف المدراء بنجاح_ ✔️"
			end
     end
if matches[1] == "ضع اسم" and matches[2] and is_mod(msg) then
local gp_name = matches[2]
setChatTitle(msg.to.id, gp_name)
end
if matches[1] == 'ضع صوره' and is_mod(msg) then
gpPhotoFile = "./data/photos/group_photo_"..msg.to.id..".jpg"
     if not msg.caption and not msg.reply_to_message then
			data[tostring(msg.to.id)]['settings']['set_photo'] = 'waiting'
			save_data(_config.moderation.data, data)
return "💢¦ _اهلا عزيزي_\n💢¦ _رجائا الان ارسل الصورة _ 💯"
     elseif not msg.caption and msg.reply_to_message then
if msg.reply_to_message.photo then
if msg.reply_to_message.photo[3] then
fileid = msg.reply_to_message.photo[3].file_id
elseif msg.reply_to_message.photo[2] then
fileid = msg.reply_to_message.photo[2].file_id
   else
fileid = msg.reply_to_message.photo[1].file_id
  end
downloadFile(fileid, gpPhotoFile)
sleep(1)
setChatPhoto(msg.to.id, gpPhotoFile)
    data[tostring(msg.to.id)]['settings']['set_photo'] = gpPhotoFile
    save_data(_config.moderation.data, data)
    end
  return "💢¦ اهلا عزيزي\n💢¦ تم تعين صورة المجموعة 💯 "
     elseif msg.caption and not msg.reply_to_message then
if msg.photo then
if msg.photo[3] then
fileid = msg.photo[3].file_id
elseif msg.photo[2] then
fileid = msg.photo[2].file_id
   else
fileid = msg.photo[1].file_id
  end
downloadFile(fileid, gpPhotoFile)
sleep(1)
setChatPhoto(msg.to.id, gpPhotoFile)
    data[tostring(msg.to.id)]['settings']['set_photo'] = gpPhotoFile
    save_data(_config.moderation.data, data)
    end
  return "💢¦ اهلا عزيزي\n💢¦ تم تعين صورة المجموعة 💯 "
		end
  end
if matches[1] == "مسح الصوره" and is_mod(msg) then
deleteChatPhoto(msg.to.id)
  return "💢¦ تم حذف صورة *المجموعة* 💯 "
end
  if matches[1] == "ضع وصف" and matches[2] and is_mod(msg) then
     if msg.to.type == "supergroup" then
   setChatDescription(msg.to.id, matches[2])
       data[tostring(msg.to.id)]['about'] = matches[2]
	  save_data(_config.moderation.data, data)
    elseif msg.to.type == "group" then
    data[tostring(msg.to.id)]['about'] = matches[2]
	  save_data(_config.moderation.data, data)
     end
     return "💢¦ _تم وضع الوصف بنجاح_✔️"
  end
  if matches[1] == "الوصف" then
 if not data[tostring(msg.to.id)]['about'] then
     about =  "💢¦ لا يوجد وصف للمجموعة"
        else
     about = "*💢¦ وصف المجموعة :*\n"..data[tostring(chat)]['about']
      end
    return about
  end



--------------------- Welcome -----------------------
if matches[1] == "تشغيل" and is_mod(msg) then
	    local target = msg.to.id
        if matches[2] == "الردود" then
return unlock_replay(msg, data, target)
end

if matches[2] == "الايدي" then
return unlock_id(msg, data, target)
end

if matches[2] == "الترحيب" then
			welcome = data[tostring(msg.to.id)]['settings']['welcome']
		if welcome == "yes" then
return "💢¦ _اهلا عزيزي_\n💢¦ _تشغيل الترحيب شغال مسبقاً_ ✔️"
			else
		data[tostring(msg.to.id)]['settings']['welcome'] = "yes"
	    save_data(_config.moderation.data, data)
return "💢¦ _اهلا عزيزي_\n💢¦ _تم تشغيل الترحيب_ ✔️"
		end
	end
	if matches[2] == "التحذير" then
			lock_woring = data[tostring(msg.to.id)]['settings']['lock_woring']
		if lock_woring == "yes" then
return "💢¦ _اهلا عزيزي_\n💢¦ _تشغيل التحذير شغال مسبقاً_ ✔️"
			else
		data[tostring(msg.to.id)]['settings']['lock_woring'] = "yes"
	    save_data(_config.moderation.data, data)
return "💢¦ _اهلا عزيزي_\n💢¦ _تم تشغيل التحذير_ ✔️"
		end
		end
		end
if matches[1] == "ايقاف" and is_mod(msg) then
	    local target = msg.to.id
        if matches[2] == "الردود" then
        return lock_replay(msg, data, target)
        end
         if matches[2] == "الايدي" then
return lock_id(msg, data, target)
end

         if matches[2] == "الترحيب" then
    welcome = data[tostring(msg.to.id)]['settings']['welcome']
	if welcome == "no" then
	return "💢¦ _اهلا عزيزي_\n💢¦ _الترحيب بالتأكيد متوقف_ ✔️"
			else
		data[tostring(msg.to.id)]['settings']['welcome'] = "no"
	    save_data(_config.moderation.data, data)
return "💢¦ _اهلا عزيزي_\n💢¦ _تم ايقاف الترحيب_ ✔️"
			end
end

      if matches[2] == "التحذير" then
    lock_woring = data[tostring(msg.to.id)]['settings']['lock_woring']
	if lock_woring == "no" then
	return "💢¦ _اهلا عزيزي_\n💢¦ _التحذير بالتأكيد متوقف_ ✔️"
			else
		data[tostring(msg.to.id)]['settings']['lock_woring'] = "no"
	    save_data(_config.moderation.data, data)
return "💢¦ _اهلا عزيزي_\n💢¦ _تم ايقاف التحذير_ ✔️"
			end
	end
	end

	if matches[1] == "ضع الترحيب" and matches[2] and is_mod(msg) then
		data[tostring(msg.to.id)]['setwelcome'] = matches[2]
	    save_data(_config.moderation.data, data)
		return "💢¦ _تم وضع الترحيب بنجاح كلاتي 👋🏻_\n*"..matches[2].."*\n\n💢¦ _ملاحظه_\n💢¦ _تستطيع اضهار القوانين بواسطه _ ➣ *{rules}*  \n💢¦ _تستطيع اضهار الاسم بواسطه_ ➣ *{name}*\n💢¦ _تستطيع اضهار المعرف بواسطه_ ➣ *{username}*"
	end
if matches[1] == "الترحيب"  and is_mod(msg) then
		if data[tostring(msg.to.id)]['setwelcome']  then
	    return data[tostring(msg.to.id)]['setwelcome']  
	    else
		return "💢¦  _اهلا عزيزي_\n💢¦ نورت المجموعه \n"
	end
end
if matches[1]== 'رسائلي' or matches[1]=='رسايلي' then
local msgs = tonumber(redis:get('msgs:'..msg.from.id..':'..msg.to.id) or 0)
return '💬¦ عدد رسائلك : `'..msgs..'` رسالة 💯 \n\n'
end


----------------End Msg Matches--------------
end
local function pre_process(msg)
-- print(serpent.block(msg, {comment=false}))
local data = load_data(_config.moderation.data)
 if data[tostring(msg.to.id)] and data[tostring(msg.to.id)]['settings'] and data[tostring(msg.to.id)]['settings']['set_photo'] == 'waiting' and is_mod(msg) then 
gpPhotoFile = "./data/photos/group_photo_"..msg.to.id..".jpg"
    if msg.photo then
  if msg.photo[3] then
fileid = msg.photo[3].file_id
elseif msg.photo[2] then
fileid = msg.photo[2].file_id
   else
fileid = msg.photo[1].file_id
  end
downloadFile(fileid, gpPhotoFile)
sleep(1)
setChatPhoto(msg.to.id, gpPhotoFile)
    data[tostring(msg.to.id)]['settings']['set_photo'] = gpPhotoFile
    save_data(_config.moderation.data, data)
     end
		send_msg(msg.to.id, "💢¦ اهلا عزيزي\n💢¦ تم تعين صورة المجموعة 💯 ", msg.id, "md")
  end

 if msg.newuser then
	if data[tostring(msg.to.id)]  then
		wlc = data[tostring(msg.to.id)]['settings']['welcome']
		if wlc == "yes" and tonumber(msg.newuser.id) ~= tonumber(bot.id) and msg.newuser.username ~=nil and string.sub(msg.newuser.username:lower(), -3) ~= 'bot' and settings.lock_join == "no" then
    if data[tostring(msg.to.id)]['setwelcome'] then
     welcome = data[tostring(msg.to.id)]['setwelcome']
      else
	welcome = "💢¦  _اهلا عزيزي_\n💢¦ نورت المجموعة \n"

end
 if data[tostring(msg.to.id)]['rules'] then
rules = data[tostring(msg.to.id)]['rules']
else
     rules = "💢¦ _اهلا عزيزي_ 👋🏻 _القوانين كلاتي_ 👇🏻\n💢¦ _ممنوع نشر الروابط_ \n💢¦ _ممنوع التكلم او نشر صور اباحيه_ \n💢¦ _ممنوع  اعاده توجيه_ \n💢¦ _ممنوع التكلم بلطائفه_ \n💢¦ _الرجاء احترام المدراء والادمنيه _😅\n"
end
if msg.newuser.username then
user_name = "@"..check_markdown(msg.newuser.username)
else
user_name = ""
end
		welcome = welcome:gsub("{rules}", rules)
		welcome = welcome:gsub("{name}", escape_markdown(msg.newuser.first_name))
		welcome = welcome:gsub("{username}", user_name)
		welcome = welcome:gsub("{gpname}", msg.to.title)
		send_msg(msg.to.id, welcome, msg.id, "md")
        end
		end
	end
 if msg.newuser then
 if msg.newuser.id == bot.id and is_sudo(msg) then
local usersudo = string.gsub(sudouser, '@', '')
keyboard = {}
keyboard.inline_keyboard = {
{
{text= '♨️ الــمــطــور ❤️💯' ,url = 'https://t.me/'..usersudo} -- هنا خلي معرفك انته كمطور
}					
}
tkey = [[💢¦ مٌرَحُبّاً انَا بّوَتْ اسِمٌيَ ]]..botname..[[ 🎖
💢¦ اٌختْصّاصّيَ حُمٌايَةِ كِرَوَبّاتْ
💢¦ مٌنَ الُسِبّامٌ وَالُوَسِائطِ وَالُتْكِرَارَ وَالٌُخ...
💢¦ لُتْفَْعيَلُ الُبّوَتْ رَاسِلُ الُمٌطِوَرَ ]]
send_key(msg.chat.id, tkey, keyboard, msg.message_id, "html")
end
end
end

return {
  patterns = {
"^(تفعيل)$",
"^(تعطيل)$",
"^(رفع المدير)$",
"^(تنزيل المدير)$",
"^(رفع المدير) (@[%a%d%_]+)$",
"^(تنزيل المدير) (@[%a%d%_]+)$",
"^(رفع المدير) (%d+)$",
"^(تنزيل المدير) (%d+)$",
"^(رفع ادمن)$",
"^(تنزيل ادمن)$",
"^(رفع ادمن) (@[%a%d%_]+)$",
"^(تنزيل ادمن) (@[%a%d%_]+)$",
"^(رفع ادمن) (%d+)$",
"^(تنزيل ادمن) (%d+)$",
"^(رفع عضو مميز)$",
"^(تنزيل عضو مميز)$",
"^(رفع عضو مميز) (@[%a%d%_]+)$",
"^(تنزيل عضو مميز) (@[%a%d%_]+)$",
"^(رفع عضو مميز) (%d+)$",
"^(تنزيل عضو مميز) (%d+)$",
"^(الاعضاء المميزين)$",
"^(قفل) (.*)$",
"^(فتح) (.*)$",
"^(الحمايه)$",
"^(منع) (.*)$",
"^(الغاء منع) (.*)$",
"^(قائمه المنع)$",
"^(الاداريين)$",
"^(الادمنيه)$",
"^(ضع القوانين) (.*)$",
"^(القوانين)$",
"^(ضع رابط)$",
"^(الرابط)$",
"^(تغيير الرابط)$",
"^(ضع صوره)$",
"^(مسح الصوره)$",
"^(ايدي)$",
"^(ايدي) (@[%a%d%_]+)$",
"^(مسح) (.*)$",
"^(ضع اسم) (.*)$",
"^(الترحيب)$",
"^(تشغيل) (.*)$",
"^(ايقاف) (.*)$",
"^(ضع الترحيب) (.*)$",
"^(تثبيت)$",
"^(الغاء التثبيت)$",
"^(الوصف)$",
"^(رسائلي)$",
"^(رسايلي)$",
"^(ضع وصف) (.*)$",
"^(ضع تكرار) (%d+)$",
"^([https?://w]*.?telegram.me/joinchat/%S+)$",
"^([https?://w]*.?t.me/joinchat/%S+)$"
},
  run = VerBot,
  pre_process = pre_process
}
--[[
by omar alsaray @blcon  \ @verxbot
اي استفسار او لديك مشكله تابع قناتي @verxbot 
او مراسلتي ع الخاص
تم تعريب االترمنال من قبل عمر السراي
]]
