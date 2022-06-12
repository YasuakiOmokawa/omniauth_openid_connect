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
