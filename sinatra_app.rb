require 'sinatra'
require 'debug'
require 'omniauth'

use Rack::Session::Cookie
use OmniAuth::Strategies::Developer

get '/' do
  "value = " << session[:value].inspect
end

get '/:value' do
  session[:value] = params['value']
end
