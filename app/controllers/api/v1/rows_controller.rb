class Api::V1::RowsController < ApplicationController
  def create
    board = Board.find(params[:board_id])
    row = board.rows.create(key: key, value: value)
    if row.valid?
      render json: :success
    else
      render json: row
    end
  end
end
