# ===============
#     TAGS
# ===============

# INDEX
get '/tags'  do
	erb :'tags/index'
end

# SHOW
get '/tags/:id' do
	erb :'tags/show'
end