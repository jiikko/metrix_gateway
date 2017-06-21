class Api::V1::BoardsController < Api::BaseController
  def create
    bloard = Board.find_or_create_by!(name: params[:board_id])
    if bloard && params[:blocking_interval_of_equivalent]
      bloard.blocking_interval_of_equivalent = params[:blocking_interval_of_equivalent]
      bloard.save! if bloard.changed?
    end
    head :ok
  end
end
