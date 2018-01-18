require 'pg'
#settings for activerecord
require 'active_record'

options={
	adapter:'postgresql',
	database:'gooddeedhunting'
}

ActiveRecord::Base.establish_connection( ENV['DATABASE_URL'] || options)
