# 特定のテストを実行するコマンド
rake test TEST=test/lib/omniauth/strategies/openid_connect_test.rb TESTOPTS="--name=test_callback_phase -v"

# config.ruに書いたコードを実行
bundle exec rackup -s puma

# ↑で起動したrackアプリにリクエストを送る
curl -v http://localhost:9292/

# アクセストークン取得を疑似体験
client.access_token!(scope: (options.scope if options.send_scope_to_token_endpoint), client_auth_method: options.client_auth_method)
