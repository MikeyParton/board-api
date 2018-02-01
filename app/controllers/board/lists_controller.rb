class Board::ListsController < ::AuthorizedController
  before_action :find_list, only: [:show, :update, :destroy]
  before_action :find_board, only: [:create]

  def create
    binding.pry
    @list = List.new(list_params)


    if @list.save
      render json: { list: ListSerializer.new(@list) }, status: 201
    else
      render json: { errors: @list.errors.full_messages }, status: 422
    end
  end

  def update
    if @list.update(list_params)
      render json: { list: ListSerializer.new(@list) }, status: 200
    else
      render json: { errors: @list.errors.full_messages }, status: 422
    end
  end

  def destroy
    if @list.destroy
      render json: {}, status: 200
    else
      render json: { errors: @list.errors.full_messages }, status: 422
    end
  end

  private

  def find_board
    @board = Board.friendly.find(params[:board_id])
  end

  def find_list
    @list = List.find(id: params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :board_id)
  end
end
