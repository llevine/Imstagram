# ===============
#     PHOTOS
# ===============

# INDEX - shows all the photoposts in the db
get '/photos' do
	@photos = Photo.order(created_at: :desc)
	erb :'photos/index'
end

# NEW - brings up the create a new photo form
get '/photos/new' do
	@member = Member.all
	@photo = Photo.all
	@tags = Tag.all
	erb :'photos/new'
end

# SHOW - shows an individual photo post.
get '/photos/:id' do
	@photo = Photo.find(params[:id])
	@tags = Tag.all
	erb :'photos/show'
end

# CREATE - puts the photo in the database and redirects to appropriate page
post '/photos/:id' do
	photo = Photo.new(params[:photo])
	# adds a tag to a new photo
	tag = Tag.find(params[:tags])
	photo.tags << tag
	photo.save
	redirect "/photos/#{photo.id}"
end

# EDIT - edit an individual photo post
get '/photos/:id/edit' do
	@photo = Photo.find(params[:id])
	@member = Member.all
	@tags = Tag.all
	erb :'photos/edit'
end

# UPDATE - actually updates the info in the db for the edit route
put '/photos/:id' do
	photo = Photo.find(params[:id])
	if photo.update(params[:photo])
		redirect "/photos/#{photo.id}"
	else
		redirect "/photos/#{photo.id}/edit"
	end
end

# DESTROY - delete the photo post from the db
delete '/photos/:id' do
	photo = Photo.find(params[:id])
	if photo.destroy
		redirect('/photos')
	else
		redirect("/photos/#{photo.id}")
	end
end