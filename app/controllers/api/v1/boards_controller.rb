class Api::V1::BoardsController < Api::BaseController
  def create
    Board.find_or_create_by!(name: params[:board_id])
    head :ok
  end
end
