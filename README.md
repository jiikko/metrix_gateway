# README
* BIツール用DataSourceのためのAPIサーバ
* 同日は同値のレコードを登録できない

## 送信サンプルコマンド
```shell
# borad を新規作成
curl 'http://localhost:3000/api/v1/boards' -X POST -d "board_id=test_queue_times"

# 1行登録
curl 'http://localhost:3000/api/v1/boards/test_queue_times/rows' -X POST -d "key=hoge_model_spec&value=5"
```

## インストール
```
$ git clone https://github.com/jiikko/metrix_gateway && cd metrix_gateway
$ bundle install --path vendor/bundler --jobs 30
$ bundle exec rake db:create RAILS_ENV=production
$ bundle exec rake db:migrate RAILS_ENV=production
```

## テストサーバのアプリケーションrootにある .test_queue_stats からデータを登録するサンプル
```shell
GATEWAY_APP_HOST="localhost:3000"
BOARD_ID=hoge_project_test_queue_times
REMOTE_GET_FILE="ssh lxc \"dssh master cat /var/www/hoge/.test_queue_stats\""

$REMOTE_GET_FILE > dottest_queue_stats
curl 'http://${GATEWAY_APP_HOST}/api/v1/boards' -X POST -d "board_id=${BOARD_ID}"
curl_cmds=$(ruby <<-RUBY
stats_hash = Marshal.load(File.open('dottest_queue_stats'))
stats_hash.each do |key, value|
  gsubed_key = key.sub('RSpec::ExampleGroups::', '')
  puts "curl 'http://${GATEWAY_APP_HOST}/api/v1/boards/${BOARD_ID}/rows' -X POST -d \"key=#{gsubed_key}&value=#{value}\""
end
RUBY
)
eval $curl_cmds
```
