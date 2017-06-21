class Api::V1::RowsController < Api::BaseController
  def create
    board = Board.find_by(id: params[:board_id]) || Board.find_by(name: params[:board_id])
    raise(ActiveRecord::RecordNotFound) unless board
    ActiveRecord::Base.transaction do
      board.lock!
      rows = board.rows.where(
        created_at: board.blocking_interval_of_equivalent.second.ago..Time.now
      ).find_or_create_by!(key: params[:key], value: params[:value])
      head :ok
    end
  end
end
