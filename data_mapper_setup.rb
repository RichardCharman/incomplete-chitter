require 'data_mapper'
require 'dm-timestamps'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_challenge_#{env}")

require './app/tricher'

DataMapper.finalize

DataMapper.auto_upgrade!