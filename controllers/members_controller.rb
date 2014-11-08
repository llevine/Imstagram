# ===============
#     MEMBERS
# ===============

# INDEX - show all members
get '/members'  do
	@members = Member.all
	erb :'members/index'
end

# NEW - brings up the create a new member form
get '/members/new' do
	erb :'members/new'
end

# SHOW - individual member
get '/members/:id' do
	@member = Member.find(params[:id])
	erb :'members/show'
end

# CREATE - puts the member in the database and redirects to appropriate page
post '/members/:id' do
	member = Member.new(params[:member])
	if member.save
		redirect "/members/#{member.id}"
	else
		redirect "/members/new"
	end
end

# EDIT - Brings up the edit form
get '/members/:id/edit' do
	@member = Member.find(params[:id])
	erb :'members/edit'
end


# UPDATE - Updates the db and redirects to show the user the updates
put '/members/:id' do
	member = Member.find(params[:id])
	if member.update(params[:member])
			redirect "/members/#{member.id}"
	else
		redirect "/members/#{member.id}/edit"
	end
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

# GET      /songs/:id/edit    yes
# PUT      /songs/:id          no  // 