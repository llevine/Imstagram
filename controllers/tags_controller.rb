# ===============
#     TAGS
# ===============

# INDEX
get '/tags'  do
	@tags = Tag.order(name: :asc)
	erb :'tags/index'
end

# SHOW
get '/tags/:id' do
	@photos = Photo.all
	@tag = Tag.find(params[:id])
	erb :'tags/show'
end