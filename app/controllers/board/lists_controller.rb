class Board::ListsController < ::AuthorizedController
  before_action :find_board

  def create
    @list = @board.lists.new(permitted_params.list)
    if @list.save
      render json: { list: ListSerializer.new(@list) }, status: 201
    else
      render json: { errors: @list.errors.full_messages }, status: 422
    end
  end

  private

  def find_board
    @board = Board.friendly.find(params[:board_id])
  end
end
