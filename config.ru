class HelloRackApp
  # callメソッドはenvを受け取り、3つの値(StatusCode, Headers, Body)を配列として返す
  def call(env)
    # require 'pp'
    # pp env

    session

    [200, { "Content-Type" => "text/plain" }, ["Hello Rack!\n"]]
  end
end

# callメソッドを呼び出せるObjectをrunに渡し、rackアプリを起動する
run HelloRackApp.new
