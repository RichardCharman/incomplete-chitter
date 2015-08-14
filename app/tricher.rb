require 'sinatra/base'
require 'sinatra/flash'
require_relative '../data_mapper_setup'
require_relative './models/peep'
require_relative './models/user'

class Tricher < Sinatra::Base
  # Force port for Nitrous
  configure :development do
    set :bind, '0.0.0.0'
    set :port, 3000
  end
  
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash  
  use Rack::MethodOverride
  
  helpers do
    def current_user
      User.get(session[:user_id])
    end
  end
  
  get '/' do
    erb :start
  end
  
  get '/peeps' do
    @peeps = Peep.all
    erb :index
  end

  post '/peeps' do
    timestamp = Time.now
    peep = Peep.new(text: params[:text], timestamp: timestamp)
    peep.save
    redirect to '/peeps'
  end
  
  get '/peeps/new' do
    erb :'peeps/new'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email],
                password: params[:password],
                name: params[:name],
                username: params[:username])
    session[:user_id] = @user.id
    redirect to '/peeps'
  end
end