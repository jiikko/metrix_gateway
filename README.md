# README

# TODO
* 本番環境
  * http://docs.docker.jp/compose/rails.html
* サンプルのコマンドつくる

# サンプルコマンド
curl 'http://localhost:3000/api/v1/boards' -X POST -d "board_id=test_queue_times"
curl 'http://localhost:3000/api/v1/boards/test_queue_times/rows' -X POST -d "key=hoge_model_spec&value=5"
