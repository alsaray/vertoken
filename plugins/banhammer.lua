--[[
by omar alsaray @blcon  \ @verxbot
اي استفسار او لديك مشكله تابع قناتي @verxbot 
او مراسلتي ع الخاص
]]
local function run(msg, matches)
local data = load_data(_config.moderation.data)
 if not data[tostring(msg.to.id)] then return end

----------------kick by replay ----------------
if matches[1] == 'طرد' and is_mod(msg) then
   if msg.reply_id and not matches[2] then
if tonumber(msg.reply.id) == tonumber(our_id) then
   return "💢¦ عذرا لا استطيع طرد نفسي ❌"
    end
if is_mod1(msg.to.id, msg.reply.id) then
   return "💢¦ عذرا لا استطيع  طرد المدراء او الادمنيه"
    else
	kick_user(msg.reply.id, msg.to.id) 
    return "💢¦ العضو :  "..("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)).."\n💢¦ الايدي :  ["..msg.reply.id.."]\n💢¦ تم طرده ✔️ "
 end
	elseif matches[2] and string.match(matches[2], '@[%a%d_]')  then
   if not resolve_username(matches[2]).result then
   return "💢¦ العضو غير موجود"
    end
	local User = resolve_username(matches[2]).information
if tonumber(User.id) == tonumber(our_id) then
   return "💢¦ عذرا لا استطيع طرد نفسي ❌"
    end
if is_mod1(msg.to.id, User.id) then
   return "💢¦ عذرا لا استطيع  طرد المدراء او الادمنيه"
     else
	kick_user(User.id, msg.to.id) 
return "💢¦ العضو :  "..check_markdown(matches[2]).."\n💢¦ الايدي :  ["..User.id.."]\n💢¦ تم طرده ✔️ "
  end
   elseif matches[2] and string.match(matches[2], '^%d+$') then
if tonumber(matches[2]) == tonumber(our_id) then
   return "💢¦ عذرا لا استطيع طرد نفسي ❌"
    end
if is_mod1(msg.to.id, tonumber(matches[2])) then
   return "💢¦ عذرا لا استطيع  طرد المدراء او الادمنيه"
   else
kick_user(tonumber(matches[2]), msg.to.id) 
return "💢¦ الايدي :  ["..check_markdown(matches[2]).."]\n💢¦ تم طرده ✔️ "
end
end
end 

---------------Ban-------------------      

if matches[1] == 'حظر' and is_mod(msg) then
if msg.reply_id and not matches[2] then
if tonumber(msg.reply.id) == tonumber(our_id) then
   return "💢¦ عذرا لا استطيع حظر نفسي ❌"
    end
if is_mod1(msg.to.id, msg.reply.id) then
   return "💢¦ عذرا لا استطيع  حظر المدراء او الادمنيه "
    end
  if is_banned(msg.reply.id, msg.to.id) then
    return "💢¦ العضو :  "..("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)).."\n💢¦ الايدي :  ["..msg.reply.id.."]\n💢¦ انه بالتاكيد تم حظره ✔️ "
    else
ban_user(("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)), msg.reply.id, msg.to.id)
kick_user(msg.reply.id, msg.to.id) 
return "💢¦ العضو :  "..("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)).."\n💢¦ الايدي :  ["..msg.reply.id.."]\n💢¦ تم حظره ✔️ "
  end
	elseif matches[2] and string.match(matches[2], '@[%a%d_]') then
   if not resolve_username(matches[2]).result then
   return "💢¦ العضو غير موجود"
    end
	local User = resolve_username(matches[2]).information
if tonumber(User.id) == tonumber(our_id) then
   return "💢¦ عذرا لا استطيع حظر نفسي ❌"
    end
if is_mod1(msg.to.id, User.id) then
   return "💢¦ عذرا لا استطيع  حظر المدراء او الادمنيه "
    end
  if is_banned(User.id, msg.to.id) then
    return "💢¦ العضو :  @"..check_markdown(User.username).."\n💢¦ الايدي :  "..User.id.." \n💢¦ انه بالتاكيد تم حظره ✔️ "
    else
   ban_user(check_markdown(User.username), User.id, msg.to.id)
     kick_user(User.id, msg.to.id) 
return "💢¦ العضو :  @"..check_markdown(User.username).."\n💢¦ الايدي :  "..User.id.." \n💢¦ انه بالتاكيد تم حظره ✔️ "
  end
   elseif matches[2] and string.match(matches[2], '^%d+$') then
if tonumber(matches[2]) == tonumber(our_id) then
   return "💢¦ عذرا لا استطيع حظر نفسي ❌"
    end
if is_mod1(msg.to.id, tonumber(matches[2])) then
   return "💢¦ عذرا لا استطيع  حظر المدراء او الادمنيه "
    end
  if is_banned(tonumber(matches[2]), msg.to.id) then
    return "💢¦ العضو :    : "..matches[2].."\n 💢¦ انه بالتاكيد تم حظره ✔️ "
    else
   ban_user('', matches[2], msg.to.id)
     kick_user(tonumber(matches[2]), msg.to.id)
    return "💢¦ العضو :    : "..matches[2].." \n💢¦  تم  حظره "
        end
     end
   end

---------------Unban-------------------                         

if matches[1] == 'الغاء الحظر' and is_mod(msg) then
if msg.reply_id and not matches[2] then
if tonumber(msg.reply.id) == tonumber(our_id) then
   return "💢¦ عذرا لا استطيع كتم نفسي ❌"
    end
if is_mod1(msg.to.id, msg.reply.id) then
   return "💢¦ عذرا لا استطيع  حظر المدراء او الادمنيه "
    end
  if not is_banned(msg.reply.id, msg.to.id) then
    return "💢¦ العضو :  "..("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)).." \n💢¦ الايدي :  "..msg.reply.id.." \n💢¦ انه بالتاكيد تم الغاء حظره ✔️ "
    else
unban_user(msg.reply.id, msg.to.id)
    return "💢¦ العضو :  "..("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)).." \n💢¦ الايدي :  "..msg.reply.id.." \n💢¦  تم الغاء حظره ✔️ "
  end
	elseif matches[2] and string.match(matches[2], '@[%a%d_]')  then
   if not resolve_username(matches[2]).result then
   return "💢¦ العضو غير موجود"
    end
	local User = resolve_username(matches[2]).information
  if not is_banned(User.id, msg.to.id) then
    return "💢¦ العضو :  @"..check_markdown(User.username).."\n💢¦ الايدي :  "..User.id.." \n💢¦ انه بالتاكيد تم الغاء  حظره "
    else
   unban_user(User.id, msg.to.id)
    return "💢¦ العضو :  @"..check_markdown(User.username).." \n💢¦ الايدي :  "..User.id.." \n💢¦  تم الغاء حظره ✔️ "
  end
   elseif matches[2] and string.match(matches[2], '^%d+$') then
  if not is_banned(tonumber(matches[2]), msg.to.id) then
    return "💢¦ العضو :  "..matches[2].." \n💢¦ انه بالتاكيد تم الغاء حظره ✔️  "
    else
   unban_user(matches[2], msg.to.id)
    return "💢¦ العضو :  "..matches[2].." \n💢¦ تم الغاء حظره ✔️  "
        end
     end
   end

------------------------Silent-------------------------------------

if matches[1] == 'كتم' and is_mod(msg) then
if msg.reply_id and not matches[2] then
if tonumber(msg.reply.id) == tonumber(our_id) then
   return "💢¦ عذرا لا استطيع كتم نفسي ❌"
    end
if is_mod1(msg.to.id, msg.reply.id) then
   return "💢¦ عذرا لا استطيع  كتم المدراء او الادمنيه "
    end
  if is_silent_user(msg.reply.id, msg.to.id) then
    return "💢¦ العضو :  "..("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)).."\n💢¦ الايدي :  ["..msg.reply.id.."]\n💢¦ انه بالتاكيد تم كتمه ✔️ "
    else
silent_user(("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)), msg.reply.id, msg.to.id)
    return "💢¦ العضو :  "..("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)).."\n💢¦ الايدي :  ["..msg.reply.id.."]\n💢¦ تم كتمه ✔️ "
  end
	elseif matches[2] and string.match(matches[2], '@[%a%d_]')  then
   if not resolve_username(matches[2]).result then
   return "💢¦ العضو غير موجود"
    end
	local User = resolve_username(matches[2]).information
if tonumber(User.id) == tonumber(our_id) then
   return "💢¦ عذرا لا استطيع كتم نفسي ❌"
    end
if is_mod1(msg.to.id, User.id) then
   return "💢¦ عذرا لا استطيع  كتم المدراء او الادمنيه "
    end
  if is_silent_user(User.id, msg.to.id) then
    return "💢¦ العضو :  @"..check_markdown(User.username).."\n💢¦ الايدي :  "..User.id.." \n💢¦ انه بالتاكيد تم كتمه ✔️ "
    else
   silent_user("@"..check_markdown(User.username), User.id, msg.to.id)
return "💢¦ العضو :  @"..check_markdown(User.username).."\n💢¦ الايدي :  "..User.id.." \n💢¦ انه بالتاكيد تم كتمه ✔️ "
  end
   elseif matches[2] and string.match(matches[2], '^%d+$') then
if tonumber(matches[2]) == tonumber(our_id) then
   return "💢¦ عذرا لا استطيع كتم نفسي ❌"
    end
if is_mod1(msg.to.id, tonumber(matches[2])) then
   return "💢¦ عذرا لا استطيع  كتم المدراء او الادمنيه "
    end
  if is_silent_user(tonumber(matches[2]), msg.to.id) then
    return "💢¦ العضو : "..matches[2].."\n 💢¦ انه بالتاكيد تم كتمه ✔️ "
    else
   silent_user("@", tonumber(matches[2]), msg.to.id)
    return "💢¦ العضو : "..matches[2].." \n💢¦  تم  كتمه ✔️"
        end
     end
   end

------------------------Unsilent----------------------------
if matches[1] == 'الغاء الكتم' and is_mod(msg) then
if msg.reply_id and not matches[2] then
if tonumber(msg.reply.id) == tonumber(our_id) then
   return "💢¦ عذرا لا استطيع كتم نفسي ❌"
    end
if is_mod1(msg.to.id, msg.reply.id) then
   return "💢¦ عذرا لا استطيع  حظر المدراء او الادمنيه "
    end
  if not is_silent_user(msg.reply.id, msg.to.id) then
    return "💢¦ العضو :  "..("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)).." \n💢¦ الايدي :  "..msg.reply.id.." \n💢¦ انه بالتاكيد تم الغاء كتمه ✔️"
    else
unsilent_user(msg.reply.id, msg.to.id)
    return "💢¦ العضو :  "..("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)).." \n💢¦ الايدي :  "..msg.reply.id.." \n💢¦  تم الغاء كتمه ✔️"
  end
	elseif matches[2] and string.match(matches[2], '@[%a%d_]')  then
   if not resolve_username(matches[2]).result then
   return "💢¦ العضو غير موجود"
    end
	local User = resolve_username(matches[2]).information
  if not is_silent_user(User.id, msg.to.id) then
    return "💢¦ العضو :  @"..check_markdown(User.username).."\n💢¦ الايدي :  "..User.id.." \n💢¦ انه بالتاكيد تم الغاء  كتمه ✔️"
    else
   unsilent_user(User.id, msg.to.id)
    return "💢¦ العضو :  @"..check_markdown(User.username).." \n💢¦ الايدي :  "..User.id.." \n💢¦  تم الغاء كتمه ✔️"
  end
   elseif matches[2] and string.match(matches[2], '^%d+$') then
  if not is_silent_user(tonumber(matches[2]), msg.to.id) then
    return "💢¦ العضو :  "..matches[2].." \n💢¦ انه بالتاكيد تم الغاء كتمه ✔️ "
    else
   unsilent_user(matches[2], msg.to.id)
    return "💢¦ العضو :  "..matches[2].." \n💢¦ تم الغاء كتمه ✔️ "
        end
     end
   end
-------------------------Banall-------------------------------------
                   
if matches[1] == 'حظر عام' and is_sudo(msg) then
if msg.reply_id and not matches[2] then
if tonumber(msg.reply.id) == tonumber(our_id) then
return "💢¦ عذرا لا استطيع حظر عام لنفسي ❌"
end

  if is_gbanned(msg.reply.id) then
    return "💢¦ العضو :  "..("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)).."\n💢¦ الايدي :  ["..msg.reply.id.."]\n💢¦ انه بالتاكيد تم حظره ✔️ عام  "
    else
banall_user(("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)), msg.reply.id)
     kick_user(msg.reply.id, msg.to.id) 
    return "💢¦ العضو :  "..("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)).."\n💢¦ الايدي :  ["..msg.reply.id.."]\n💢¦ تم حظره ✔️ عام "
  end

elseif matches[2] and string.match(matches[2], '@[%a%d_]')  then
   if not resolve_username(matches[2]).result then
   return "💢¦ العضو غير موجود"
    end
	local User = resolve_username(matches[2]).information
if tonumber(User.id) == tonumber(our_id) then
   return "💢¦ عذرا لا استطيع حظر عام لنفسي ❌"
    end
  if is_gbanned(User.id) then
    return "💢¦ العضو :  @"..check_markdown(User.username).."\n💢¦ الايدي :  "..User.id.." \n💢¦ انه بالتاكيد تم حظره ✔️ عام  "
    else
   banall_user("@"..check_markdown(User.username), User.id)
     kick_user(User.id, msg.to.id) 
return "💢¦ العضو :  @"..check_markdown(User.username).."\n💢¦ الايدي :  "..User.id.." \n💢¦ تم حظره ✔️ عام "
  end
   elseif matches[2] and string.match(matches[2], '^%d+$') then
if tonumber(matches[2]) == tonumber(our_id) then
   return "💢¦ عذرا لا استطيع حظر عام لنفسي ❌"
    end
  if is_gbanned(tonumber(matches[2])) then
    return "💢¦ العضو : "..matches[2].."\n 💢¦ انه بالتاكيد تم حظره ✔️ عام  "
    else
   banall_user('', matches[2])
     kick_user(tonumber(matches[2]), msg.to.id)
    return "💢¦ العضو : "..matches[2].." \n💢¦  تم  حظره عام ✔️  "
        end
     end
   end
--------------------------Unbanall-------------------------

if matches[1] == 'الغاء العام' and is_sudo(msg) then
if msg.reply_id and not matches[2] then
if tonumber(msg.reply.id) == tonumber(our_id) then
   return "💢¦ عذرا لا استطيع جظر  نفسي ❌"
    end
if is_mod1(msg.to.id, msg.reply.id) then
   return "💢¦ عذرا لا استطيع  حظر المدراء او الادمنيه "
    end
  if not is_gbanned(msg.reply.id) then
    return "💢¦ العضو :  "..("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)).." \n💢¦ الايدي :  "..msg.reply.id.." \n💢¦ انه بالتاكيد تم الغاء حظره ✔️ عام  "
    else
unbanall_user(msg.reply.id)
    return "💢¦ العضو :  "..("@"..check_markdown(msg.reply.username) or escape_markdown(msg.reply.print_name)).." \n💢¦ الايدي :  "..msg.reply.id.." \n💢¦  تم الغاء حظره ✔️ عام  "
  end
	elseif matches[2] and string.match(matches[2], '@[%a%d_]')  then
   if not resolve_username(matches[2]).result then
   return "💢¦ العضو غير موجود"
    end
	local User = resolve_username(matches[2]).information
  if not is_gbanned(User.id) then
    return "💢¦ العضو :  @"..check_markdown(User.username).."\n💢¦ الايدي :  "..User.id.." \n💢¦ انه بالتاكيد تم الغاء  حظره عام ✔️  "
    else
   unbanall_user(User.id)
    return "💢¦ العضو :  @"..check_markdown(User.username).." \n💢¦ الايدي :  "..User.id.." \n💢¦  تم الغاء حظره ✔️ عام  "
  end
   elseif matches[2] and string.match(matches[2], '^%d+$') then
  if not is_gbanned(tonumber(matches[2])) then
    return "💢¦ العضو :  "..matches[2].." \n💢¦ انه بالتاكيد تم الغاء حظره ✔️ عام   "
    else
   unbanall_user(matches[2])
    return "💢¦ العضو :  "..matches[2].." \n💢¦ تم الغاء حظره ✔️ عام   "
        end
     end
   end
   -----------------------------------LIST---------------------------
   if matches[1] == 'المحظورين' and is_mod(msg) then
   return banned_list(msg.to.id)
   end
   if matches[1] == 'المكتومين' and is_mod(msg) then
   return silent_users_list(msg.to.id)
   end
   if matches[1] == 'قائمه العام' and is_sudo(msg) then
   return gbanned_list(msg)
   end
   -----------

   ---------------------------clean---------------------------
   if matches[1] == 'مسح' and is_mod(msg) then
       
if not matches[2] and msg.reply_id and is_mod(msg) then
del_msg(msg.to.id, msg.reply_id)
del_msg(msg.to.id, msg.id)
end

if matches[2] and string.match(matches[2], '^%d+$') and is_mod(msg) then
local num = matches[2]
if 100 < tonumber(num) then
return "💢¦_حدود المسح ,  يجب ان تكون ما بين _ *[2-100]*"
end
print("🗑¦ تم مسح ["..num.."] رسالة  💯")
for i=1,tonumber(num) do
del_msg(msg.to.id,msg.id - i)
end
return"🗑¦ تم مسح `"..num.."` رسالة  💯"
end
       
	if matches[2] == 'المحظورين' then
		if next(data[tostring(msg.to.id)]['banned']) == nil then
			return "💢¦_ عذرا لا يوجد مستخدمين محظورين في هذه المجموعه _"
		end
		for k,v in pairs(data[tostring(msg.to.id)]['banned']) do
			data[tostring(msg.to.id)]['banned'][tostring(k)] = nil
			save_data(_config.moderation.data, data)
		end
		return "💢¦_ تم مسح جميع الاعضاء المحظورين في هذه المجموعه _"
	end
	
	if matches[2] == 'المكتومين' then
		if next(data[tostring(msg.to.id)]['is_silent_users']) == nil then
			return "💢¦_ عذرا لا يوجد مستخدمين مكتومين  في هذه المجموعه _"
		end
		for k,v in pairs(data[tostring(msg.to.id)]['is_silent_users']) do
			data[tostring(msg.to.id)]['is_silent_users'][tostring(k)] = nil
			save_data(_config.moderation.data, data)
		end
		return "💢¦_ تم مسح جميع  الاعضاء المكتومين  في هذه المجموعه _"
	end
	
	if matches[2] == 'قائمه العام' and is_sudo(msg) then
		if next(data['gban_users']) == nil then
			return "💢¦_ عذرا لا يوجد مستخدمين محظورين عام  في هذه المجموعه _"
		end
		for k,v in pairs(data['gban_users']) do
			data['gban_users'][tostring(k)] = nil
			save_data(_config.moderation.data, data)
		end
		return "💢¦_ تم مسح جميع  الاعضاء المحظورين عام   في هذه المجموعه _"
	end
   end

end
return {
	patterns = {
"^(حظر عام) (@[%a%d%_]+)$",
"^(حظر عام) (%d+)$",
"^(الغاء العام) (@[%a%d%_]+)$",
"^(الغاء العام) (%d+)$",
"^(الغاء العام)$",
"^(حظر) (@[%a%d%_]+)$",
"^(حظر) (%d+)$",
"^(حظر)$",
"^(الغاء الحظر) (@[%a%d%_]+)$",
"^(الغاء الحظر) (%d+)$",
"^(الغاء الحظر)$",
"^(طرد) (@[%a%d%_]+)$",
"^(طرد) (%d+)$",
"^(طرد)$",
"^(كتم) (@[%a%d%_]+)$",
"^(كتم) (%d+)$",
"^(كتم)$",
"^(الغاء الكتم) (@[%a%d%_]+)$",
"^(الغاء الكتم) (%d+)$",
"^(الغاء الكتم)$",
"^(المحظورين)$",
"^(قائمه العام)$",
"^(المكتومين)$",
"^(مسح)$",
"^(مسح) (.*)$",
	},
	run = run,

}
--[[
by omar alsaray @blcon  \ @verxbot
اي استفسار او لديك مشكله تابع قناتي @verxbot 
او مراسلتي ع الخاص
]]
