require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

# CONTROLLERS
require_relative 'controllers/home_controller'
require_relative 'controllers/photos_controller'
require_relative 'controllers/tags_controller'
require_relative 'controllers/members_controller'

# MODELS
require_relative 'models/photo.rb'
require_relative 'models/member.rb'
require_relative 'models/tag.rb'

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')
after { ActiveRecord::Base.connection.close }

run Sinatra::Application