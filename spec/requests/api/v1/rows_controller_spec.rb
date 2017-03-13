require 'rails_helper'

describe Api::V1::RowsController do
  fixtures :all

  describe 'POST "create"' do
    it 'be sucess' do
      board = Board.create(name: 'test')
      post "/api/v1/boards/#{board.id}/rows", params: { key: 3, value: 5 }
      expect(response.status).to eq(200)
      expect(board.rows.count).to eq(1)
      row = board.rows.first
      expect(row.key).to eq('3')
      expect(row.value).to eq(5)
    end

    context '同じパラメータを送信する時' do
      it '1 recordだけ作成すること' do
        board = Board.create(name: 'test')
        post "/api/v1/boards/#{board.id}/rows", params: { key: 3, value: 5 }
        post "/api/v1/boards/#{board.id}/rows", params: { key: 3, value: 5 }
        expect(board.rows.count).to eq(1)
        row = board.rows.first
        expect(row.key).to eq('3')
        expect(row.value).to eq(5)
      end
    end

    context '存在しないboard_id を送信する時' do
      it 'be not found' do
        post "/api/v1/boards/0/rows", params: { key: 3, value: 5 }
        expect(response.status).to eq(404)
      end
    end

    context 'params[:key] がない時' do
      it 'be not found' do
        board = Board.create(name: 'test')
        post "/api/v1/boards/#{board.id}/rows", params: { value: 5 }
        expect(response.status).to eq(500)
      end
    end

    context 'params[:value] がない時' do
      it 'be not found' do
        board = Board.create(name: 'test')
        post "/api/v1/boards/#{board.id}/rows", params: { key: 5 }
        expect(response.status).to eq(500)
      end
    end
  end
end
