# 特定のテストを実行するコマンド
rake test TEST=test/lib/omniauth/strategies/openid_connect_test.rb TESTOPTS="--name=test_callback_phase -v"

# config.ruに書いたコードを実行
bundle exec rackup -s puma

# ↑で起動したrackアプリにリクエストを送る
curl -v http://localhost:9292/
