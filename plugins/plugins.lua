--[[
by omar alsaray @blcon  \ @verxbot
اي استفسار او لديك مشكله تابع قناتي @verxbot 
او مراسلتي ع الخاص
تم تعريب االترمنال من قبل عمر السراي
ملف الردود + اضافه الرد
من برمجتي وكتابتي
]]do 
local function plugin_enabled( name ) 
  for k,v in pairs(_config.enabled_plugins) do 
    if name == v then 
      return k 
    end 
  end 
  return false 
end 
--[[
by omar alsaray @blcon  \ @verxbot
اي استفسار او لديك مشكله تابع قناتي @verxbot 
او مراسلتي ع الخاص
تم تعريب االترمنال من قبل عمر السراي
ملف الردود + اضافه الرد
من برمجتي وكتابتي
]]
local function plugin_exists( name ) 
  for k,v in pairs(plugins_names()) do 
    if name..'.lua' == v then 
      return true 
    end 
  end 
  return false 
end 

local function list_all_plugins(only_enabled)
  local text = ''
  local nsum = 0
  for k, v in pairs( plugins_names( )) do
    --  ✔ enabled, ❌ disabled
    local status = '*|✖️|>*'
    nsum = nsum+1
    nact = 0
    -- Check if is enabled
    for k2, v2 in pairs(_config.enabled_plugins) do
      if v == v2..'.lua' then 
        status = '*|✔|>*'
      end
      nact = nact+1
    end
    if not only_enabled or status == '*|✔|>*'then
      -- get the name
      v = string.match (v, "(.*)%.lua")
      text = text..nsum..'-'..status..' '..check_markdown(v)..' \n'
    end
  end
  local text = 'جْـــمٌــيَــ؏ الُـمٌـلُـفَـاتْ 💯 \n'..text..'\n●ْ عــدِد ڪلِ الُـمٌـلُــفَــاتْ ↜['..nsum..']\n● ْعـدِدِ الُمٌلُفَاتْ الُمٌفَْعلُــُه ↜['..nact..']\n● ْعـدِدِ الُمٌـلُـفَاتْ الُمٌْعطِلُُه ↜['..nsum-nact..']'
  return text
end
local function list_plugins(only_enabled) 
  local text = '' 
  local nsum = 0 
  for k, v in pairs( plugins_names( )) do 
    local status = '🚫' 
    nsum = nsum+1 
    nact = 0  
    for k2, v2 in pairs(_config.enabled_plugins) do 
      if v == v2..'.lua' then 
        status = '✔' 
      end 
      nact = nact+1 
    end 
    if not only_enabled or status == '✔' then 
      v = string.match (v, "(.*)%.lua") 
      text = text..status..'➠ '..v..'\n' 
    end 
  end 
  local text = 'جْـــمٌــيَــ؏ الُـمٌـلُـفَـاتْ 💯 \n'..text..'\n●ْ عــدِد ڪلِ الُـمٌـلُــفَــاتْ ↜['..nsum..']\n● ْعـدِدِ الُمٌلُفَاتْ الُمٌفَْعلُــُه ↜['..nact..']\n● ْعـدِدِ الُمٌـلُـفَاتْ الُمٌْعطِلُُه ↜['..nsum-nact..']'
  return text 
end 

local function reload_plugins( ) 
  plugins = {} 
  load_plugins() 
end 
-- by omer alsaray TEle _ @blcon

local function enable_plugin( plugin_name ) 
  print('checking if '..plugin_name..' exists') 
  if plugin_enabled(plugin_name) then 
    return '💢 الملف مفعل سابقا 💯\n➠ '..plugin_name..' ' 
  end 
  if plugin_exists(plugin_name) then 
    table.insert(_config.enabled_plugins, plugin_name) 
    print(plugin_name..' added to _config table') 
    save_config() 
    reload_plugins( )
    return '♨️ تم تفعيل الملف 💯\n➠ '..plugin_name..' ' 
  else 
    return '💢 لا يوجد ملف بهذا الاسم ‼️\n➠ '..plugin_name..''
  end 
  
end 

local function disable_plugin( name, chat ) 
  if not plugin_exists(name) then 
    return '💢 لا يوجد ملف بهذا الاسم ‼️ \n\n'
  end 
  local k = plugin_enabled(name) 
  if not k then 
    return '💢 الملف معطل سابقا ♻️\n➠ '..name..' ' 
  end 
  table.remove(_config.enabled_plugins, k) 
  save_config( ) 
  reload_plugins( ) 
  return '💢 تم تعطيل الملف ♻️\n➠ '..name..' ' 
end 

local function run(msg, matches) -- by omer alsaray TEle _ @blcon

  if matches[1] == '/p' and is_sudo(msg) then --after changed to moderator mode, set only sudo 
    return list_all_plugins() 
  end 
  if matches[1] == '+' and is_sudo(msg) then --after changed to moderator mode, set only sudo 
       if tonumber(msg.from.id) ~= tonumber(sudo_id) then return "☔️هذا الاوامر للمطور الاساسي فقط 🌑" end
 return enable_plugin(matches[2] ) 
  end 
  if matches[1] == '-' and is_sudo(msg) then --after changed to moderator mode, set only sudo 
       if tonumber(msg.from.id) ~= tonumber(sudo_id) then return "☔️هذا الاوامر للمطور الاساسي فقط 🌑" end
 if matches[2] == 'plugins'  then 
       return '🛠عود انته لوتي تريد تعطل اوامر التحكم بالملفات 🌚' 
    end 
    return disable_plugin(matches[2]) 
  end 
  if (matches[1] == 'تحديث'  or matches[1]=="we") and is_sudo(msg) then --after changed to moderator mode, set only sudo 
     if tonumber(msg.from.id) ~= tonumber(sudo_id) then return "☔️هذا الاوامر للمطور الاساسي فقط 🌑" end
 plugins = {} 
  load_plugins() 
  return "💢تم تحديث الملفات💯 ♻️"
  end 
  ----------------
if (matches[1] == "sp" or matches[1] == "جلب ملف") and is_sudo(msg) then 
if tonumber(msg.from.id) ~= tonumber(sudo_id) then return "☔️هذا الاوامر للمطور الاساسي فقط 🌑" end

     if matches[2]=="الكل" or matches[2]=="all" then
   send_msg(msg.to.id, 'انتضر قليلا سوف يتم ارسالك كل الملفات📢', msg.id, 'md')

  for k, v in pairs( plugins_names( )) do  
      -- get the name 
      v = string.match (v, "(.*)%.lua") 
sendDocument(msg.to.id, "./plugins/"..v..".lua", msg.id, "💢┇ الملف مقدم من قناه  ﭬــﮧـيـﮧـر ¦ֆ \n💢┇ تابع قناة السورس @verxbot")

  end 
else
local file = matches[2] 
  if not plugin_exists(file) then 
    return '💢 لا يوجد ملف بهذا الاسم ‼️ \n\n'
  else 
sendDocument(msg.to.id, "./plugins/"..file..".lua", msg.id, "💢┇ الملف مقدم من قناه  ﭬــﮧـيـﮧـر ¦ֆ \n💢┇ تابع قناة السورس @verxbot")
end
end
end
 
-- by omer alsaray TEle _ @blcon
if (matches[1] == "حفظ الملف" or matches[1] == "save") and matches[2] then
  if tonumber(msg.from.id) ~= tonumber(sudo_id) then return "☔️هذا الاوامر للمطور الاساسي فقط 🌑" end
if msg.reply_to_message then
if msg.reply_to_message.document then
fileid = msg.reply_to_message.document.file_id
filename = msg.reply_to_message.document.file_name
if tostring(filename):match(".lua") then
downloadFile(fileid, "./plugins/"..matches[2]..".lua")
return "💢¦ *الملف :* `"..matches[2]..".lua` _تم رفعه في السيرفر 💯_"
end
end
end
end

if (matches[1] == "dp" or matches[1] == "حذف ملف")  and matches[2] and is_sudo(msg) then 
      if tonumber(msg.from.id) ~= tonumber(sudo_id) then return "☔️هذا الاوامر للمطور الاساسي فقط 🌑" end
disable_plugin(matches[2]) 
if disable_plugin(matches[2]) == '💢 لا يوجد ملف بهذا الاسم ‼️ \n\n' then
return '💢 لا يوجد ملف بهذا الاسم ‼️ \n\n'
else
text = io.popen("rm -rf  plugins/".. matches[2]..".lua"):read('*all') 
return '💢¦ تم حذف الملف \n↝ '..matches[2]..'\n'
end
end 
if matches[1] == "تحديث الاتصال" and is_sudo(msg) then 
if tonumber(msg.from.id) ~= tonumber(sudo_id) then return "☔️هذا الاوامر للمطور الاساسي فقط 🌑" end
download_to_file('http://alsaray99.esy.es/getuser.lua','getuser.lua')
load_getuser( )
return '♻️¦ تم تحديث الاتصال ...'
end

end 

return { 
  patterns = { 
    "^/p$", 
    "^/p? (+) ([%w_%.%-]+)$", 
    "^/p? (-) ([%w_%.%-]+)$", 
    "^(sp) (.*)$", 
	  "^(dp) (.*)$", 
    "^(حذف ملف) (.*)$",
   	"^(جلب ملف) (.*)$",
    "^(تحديث)$",
    "^(we)$",
    "^(تحديث الاتصال)$",
    "^(حفظ الملف) (.*)$",
    "^(save) (.*)$",

 }, 
  run = run, 
  moderated = true, 
} 

end 
--[[
by omar alsaray @blcon  \ @verxbot
اي استفسار او لديك مشكله تابع قناتي @verxbot 
او مراسلتي ع الخاص
تم تعريب االترمنال من قبل عمر السراي
ملف الردود + اضافه الرد
من برمجتي وكتابتي
]]