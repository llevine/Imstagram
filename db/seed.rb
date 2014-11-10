require 'active_record'
ActiveRecord::Base.establish_connection({
	database: 'imstagram_db',
	adapter: 'postgresql'
})

# Faker to generate dummy info
require 'ffaker'


# models
require_relative '../models/member.rb'
require_relative '../models/photo.rb'
require_relative '../models/tag.rb'


# Start from scratch
Member.destroy_all
Photo.destroy_all
Tag.destroy_all

# data arrays
owner_first_name = ["Lauren", "Sammy", "Nidhi", "Margaret", "Caroline", "Emily", "David", "Jamie", "James", "Pete", "Alex", "Eric", "Brian", "Arnold", "Belle", "Jonathan"]

tag_data = ["labrador", "golden lab", "havanese", "poodle", "shih tzu", "playtime", "pajamas", "puppy"]

breed_data = ["labrador", "golden lab", "havanese", "poodle", "beagle", "shih tzu", "cocker spaniel", "golden retriever", "yorkie", "great dane"]

dates_data = ["1996-01-08", "1990-11-29", "2012-01-08", "2014-01-01", "2010-10-16", "2011-11-29", "2005-05-16", "2008-06-24"]

image_data = ["http://placepuppy.it/200/300"]

toys_data = ["ball", "turtle", "frog", "rubber duck", "chicken"]

activities_data = ["long walks in the park", "chasing after birds", "playing frisbee", "digging holes", "chewing shoes"]



# creates 10 members
10.times do
	Member.create(
		owner: "#{owner_first_name.sample} #{Faker::Name.last_name}",
		name: "#{Faker::HipsterIpsum.word}",
		img_url: "http://www.fillmurray.com/g/200/300",
		birthday: dates_data.sample,
		location: "#{Faker::AddressUS.state}",
		breed: breed_data.sample,
		activities: activities_data.sample,
		toys: toys_data.sample,
		member_since: dates_data.sample
		)
end

# creates the tag info
8.times do
	Tag.create(
	name: tag_data.sample
	)
end

# creates 15 members
15.times do
	photos = Photo.new({
	title: "#{Faker::Lorem.word}",
	img_url: image_data.sample,
	location: "#{Faker::AddressUS.state}",
	caption: "#{Faker::BaconIpsum.phrase}",
	member: Member.all.sample
	})
	photos.save
	#this here makes the join
	photos.tags = Tag.all.sample(4)
end


