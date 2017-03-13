class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def edit
    @board = Board.find(params[:id])
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to '/boards', notice: '作成しました'
    else
      render :new
    end
  end

  def update
    @board = Board.find(params[:id])
    if @board.update(board_params)
      redirect_to '/boards', notice: '更新しました'
    else
      render :new
    end
  end

  private

  def board_params
    params.required(:board).permit!
  end
end
