require 'delegate' # use Rack::Session::Cookie を成功させるための設定
require 'omniauth'
require 'debug'
require_relative 'another_rack_middleware'

class App
  def call(env)
    # request = Rack::Request.new(env)
    # request.session[:id]="my session id"

    [200, { "Content-Type" => "text/plain" }, ["HELLO Rack Endpoint!\n\n"]]
  end
end

# Rack Middlewareは以下条件を満たす必要がある
#   - classであること
#   - initializeでappを受け取ること
#   - callメソッドを実装し、Status/Headers/Bodyを返すこと (Rack Endpointと同じ条件)
class HelloRackMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)

    fixed_body = ["Hello Rack Middleware!\n"] + body
    [status, headers, fixed_body]
  end
end

# class AnotherRackMiddleware
#   def initialize(app)
#     @app = app
#   end

#   def call(env)
#     status, headers, body = @app.call(env)

#     fixed_body = ["Another Rack Middleware!\n"] + body
#     [status, headers, fixed_body]
#   end
# end

class ContentLengthMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    headers['Content-Length'] = body.join.bytesize.to_s
    binding.b
    [status, headers, body]
  end
end

use Rack::Session::Cookie
use OmniAuth::Strategies::Developer
run App.new
