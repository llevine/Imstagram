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

# DESTROY - delete the Tag post from the db
delete '/tags/:id' do
	tag = Tag.find(params[:id])
	tag.destroy
	redirect('/tags')
end


# ON OTHER PAGEs  checkbox inputbox

# CREATE
post('/tags') do
  new_tag = Tag.new(params[:tag])
  new_tag.save
  redirect("/tags") 
end