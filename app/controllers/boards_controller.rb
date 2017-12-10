class BoardsController < ActionController::API
  before_action :find_board, only: [:show, :update, :destroy]
  before_action :find_list, only: [:create]

  def index
    @boards = Board.all
    render json: @boards.to_json
  end

  def show
    render json: @board, status: 200
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      render json: @board, status: 201
    else
      render json: { errors: @board.errors.full_messages }, status: 422
    end
  end

  def update
    if @board.update(board_params)
      render json: @board, status: 201
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
    @board = Board.find_by(id: params[:id])
    return render json: { errors: 'Board not found' }, status: 404 unless @board.present?
  end

  def board_params
    params.require(:board).permit(:name)
  end
end
