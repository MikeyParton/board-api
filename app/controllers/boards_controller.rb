class BoardsController < ApplicationController
  before_action :find_board, only: [:show, :update, :destroy]

  def index
    @boards = current_user.boards
    render json: { boards: @boards.map { |b| BoardSerializer.new(b) } }, status: 200
  end

  def show
    render json: { board: BoardSerializer.new(@board) }, status: 200
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      render json: { board: BoardSerializer.new(@board) }, status: 201
    else
      render json: { errors: @board.errors.full_messages }, status: 422
    end
  end

  def update
    if @board.update(board_params)
      render json: { board: BoardSerializer.new(@board) }, status: 200
    else
      render json: { errors: @board.errors.full_messages }, status: 422
    end
  end

  def destroy
    if @board.destroy
      render json: {}, status: 200
    else
      render json: { errors: @board.errors.full_messages }, status: 422
    end
  end

  private

  def find_board
    @board = Board.friendly.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:name)
  end
end
