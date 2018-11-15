# in app.rb

require 'sinatra/base'

class Birthday < Sinatra::Base
  get '/' do
    'Happy Birthday!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
