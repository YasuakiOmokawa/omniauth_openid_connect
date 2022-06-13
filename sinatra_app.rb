require 'sinatra'
require 'debug'
require 'omniauth'

enable :sessions
use OmniAuth::Strategies::Developer

get '/' do
  "value = " << session[:value].inspect
end

get '/:value' do
  session[:value] = params['value']
end
