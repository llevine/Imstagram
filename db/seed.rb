require 'active_record'
ActiveRecord::Base.establish_connection({
	database: 'imstagram_db',
	adapter: 'postgresql'
})

# Faker to generate dummy info
require 'ffaker'


# models
require_relative '../models/photo.rb'
require_relative '../models/tag.rb'
require_relative '../models/user.rb'

# Start from scratch
Photo.destroy_all
Tag.destroy_all
User.destroy_all

# data arrays
tag_data = ["labrador", "golden lab", "havanese", "poodle", "shih tzu", "playtime", "pajamas", "puppy"]

birthday_data = ["1996-01-08", "1990-11-29", "2012-01-08", "2014-01-01", "2010-10-16", "2011-11-29", "2005-05-16", "2008-06-24"]

# creates 10 users
10.times do
	User.create(
		owner: "#{Faker::Name.first}",
		dog_name: "#{Faker::HipsterIpsum.word}",
		img_url: "http://placepuppy.it/",
		birthday: birthday_data.sample,
		location: "#{Faker::AddressUS.state}",
		dog_breed: "#{Faker::AddressUS.state}",
		member_since: "#{Faker::AddressUS.state}"
		)
end

# creates 15 users
15.times do
	Photo.create(
	title: "#{Faker::AddressUS.state}",
	img_url: "#{Faker::AddressUS.state}",
	location: "#{Faker::AddressUS.state}",
	caption: "#{Faker::AddressUS.state}",
	comments: "#{Faker::AddressUS.state}"
	)
end

# creates the tag info
8.times do
	Tag.create(
	name: tag_data.sample
	)
end



# create table users(
# 	id serial primary key,
# 	owner varchar(255) not null,
# 	dog_name varchar(255),
# 	img_url text,
# 	-- DATE - format YYYY-MM-DD
# 	birthday date,
# 	location varchar(255),
# 	dog_breed varchar(255),
# 	member_since timestamp
# );

# create table photos(
# 	id serial primary key,
# 	title varchar(255),
# 	img_url text,
# 	location varchar(255),
# 	caption varchar(255),
# 	comments text
# );

# create table tags(
# 	id serial primary key,
# 	name varchar
# );

# create table photos_tags(
# 	photos_id integer references tags,
# 	tags_id integer references photos
# );