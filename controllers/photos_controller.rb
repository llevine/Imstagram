# ===============
#     PHOTOS
# ===============

# INDEX - shows all the photoposts in the db
get '/photos' do
	@photos = Photo.all
	erb :'photos/index'
end

# NEW - brings up the create a new photo form
get '/photos/new' do
	@user = User.all
	erb :'photos/new'
end

# SHOW - shows an individual photo post.
get '/photos/:id' do
	@photo = Photo.find(params[:id])
	# @user = User.find(params[:id])
	erb :'photos/show'
end

# CREATE - puts the photo in the database and redirects to appropriate page
post '/photos/:id' do
	photo = Photo.new(params[:photo])
	if photo.save
		binding.pry
		redirect "/photos/#{photo.id}"
	else
		redirect "/photos/new"
	end
end

# EDIT - edit an individual photo post
get '/photos/:id/edit' do
	@photo = Photo.find(params[:id])
	@user = User.all
	erb :'photos/edit'
end

# UPDATE - actually updates the info in the db for the edit route
put '/photos/:id' do
	binding.pry
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