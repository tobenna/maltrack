DB_URL = "postgres://localhost/mal_track_#{ENV['RACK_ENV']}".freeze
DataMapper.setup(:default, ENV['DATABASE_URL'] || DB_URL)
DataMapper.auto_migrate! if ENV['RACK_ENV'] == 'test'
DataMapper.finalize
