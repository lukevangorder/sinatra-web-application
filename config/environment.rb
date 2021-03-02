require 'bundler/setup'
Bundler.require(:default)

require_all 'app'

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/development.sqlite"
) 