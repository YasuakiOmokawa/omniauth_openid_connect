class App
  def call(env)
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

class AnotherRackMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)

    fixed_body = ["Another Rack Middleware!\n"] + body
    [status, headers, fixed_body]
  end
end

class ContentLengthMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    p body
    headers['Content-Length'] = body.join.bytesize.to_s
    [status, headers, body]
  end
end

use ContentLengthMiddleware #3
use HelloRackMiddleware #2
use AnotherRackMiddleware #1
run App.new
