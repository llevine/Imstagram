require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pry'
require 'better_errors'

require_relative 'models/photo.rb'
require_relative 'models/member.rb'
require_relative 'models/tag.rb'

require_relative 'controllers/home_controller'
require_relative 'controllers/photos_controller'
require_relative 'controllers/tags_controller'
require_relative 'controllers/members_controller'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

ActiveRecord::Base.establish_connection({
	adapter: 'postgresql',
	database: 'imstagram_db'
})

after { ActiveRecord::Base.connection.close }