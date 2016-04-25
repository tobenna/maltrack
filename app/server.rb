class MalTrack < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  register Sinatra::Partial
  set :session_secret, 'super secret'
  set :partial_template_engine, :erb
  enable :partial_underscores
  use Rack::MethodOverride
  set :root, File.join(File.dirname(__FILE__), '.')
  set :public_folder, proc { File.join(root, '../public') }

  include ViewHelper

  get '/' do
    redirect '/sessions/new' unless current_user 
    erb :home
  end
end
