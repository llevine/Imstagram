# ===============
#     PHOTOS
# ===============

# INDEX
get '/photos' do
	@photos = Photo.all
	erb :'photos/index'
end

# NEW - brings up the create a new photo form
get '/photos/new' do
	@user = User.all
	erb :'photos/new'
end

# SHOW
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

# EDIT
get '/photos/:id/edit' do
	@photo = Photo.find(params[:id])
	@user = User.all
	erb :'photos/edit'
end