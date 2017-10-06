function getUser(user_id)
local url = http.request('https://www.api.beyond-dev.ir/getUser?token=2323:fgdsea&user_id='..user_id)
local user = JSON.decode(url)
if not user then
user = JSON.decode('{"result":false}')
return user
else
return user
end
end

function resolve_username(username)
local url = http.request('https://hassan-aahmid336.c9users.io/?username='..username)
local user = JSON.decode(url)
if not user then
user = JSON.decode('{"result":false}')
return user 
else
return user
end
end