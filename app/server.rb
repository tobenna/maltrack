class MalTrack < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  register Sinatra::Partial
  set :session_secret, 'super secret'
  set :partial_template_engine, :erb
  enable :partial_underscores
  use Rack::MethodOverride

  include ViewHelper

  get '/' do
    erb :home
  end
end
