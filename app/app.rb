require 'sinatra/base'

class malTrack < Sinatra::Base
  get '/' do
    'Hello malTrack!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
