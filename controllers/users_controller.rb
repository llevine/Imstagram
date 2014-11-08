# ===============
#     USERS
# ===============

# INDEX
get '/users'  do
	erb :'users/index'
end

# SHOW
get '/users/:id' do
	erb :'users/show'
end