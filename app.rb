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

    redirect '/birthday'
  end

  get '/birthday' do
    @birthday = session[:birthday]
    @today = Date.today
    @diff = @birthday.difference(@today)
    @this_year_diff = @birthday.this_year_difference(@today)
    @day_days = @birthday.day_days
    @text_date = @birthday.date.strftime("%B %-d").gsub(" ", "_")
    @wiki_link = "https://en.wikipedia.org/wiki/#{@text_date}"
    @date_format = "%A %d %B %Y"

    erb :birthday
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
