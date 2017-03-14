class Api::V1::RowsController < Api::BaseController
  def create
    board = Board.find(params[:board_id])
    ActiveRecord::Base.transaction do
      board.lock!
      board.rows.find_or_create_by!(key: params[:key],
                                    value: params[:value],
                                    on: Date.today)
      render json: :success
    end
  end
end
