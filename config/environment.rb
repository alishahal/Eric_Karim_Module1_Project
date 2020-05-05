require "bundler/setup"
Bundler.require
require "sinatra/activerecord"
require_all 'app/models'

if ENV['ACTIVE_RECORD_ENV'] == 'test'
  # Mock Database
  # Fake Database to use while our tests run
  ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: ":memory:"
  )
else
  ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: "db/development.sqlite"
  )
end
ActiveRecord::Base.logger = nil
require_all 'app'
require_all 'lib'
 
