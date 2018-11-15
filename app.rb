# in app.rb

require 'sinatra/base'
require './lib/Birthday'

class BirthdayGreeter < Sinatra::Base

  enable :sessions
  set :session_secret, "qwerty"

  get '/' do
    erb :index
  end

  post '/birthday' do
    session[:birthday] = Birthday.new(params["birthday"])
    session[:diff] = session[:birthday].difference(Date.today)
    session[:this_year_diff] = session[:birthday].this_year_difference(Date.today)

    redirect '/birthday'
  end

  get '/birthday' do

    @birthday = session[:birthday]
    @today = Date.today
    @diff = session[:diff]
    @this_year_diff = session[:this_year_diff]
    @day_days = @birthday.day_days

    erb :birthday
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
