class Board::LabelsController < ::AuthorizedController
  before_action :find_board

  def create
    @label = @board.labels.new(permitted_params.label)
    if @label.save
      render json: { labels: [LabelSerializer.new(@label)] }, status: 201
    else
      render json: { errors: @label.errors.full_messages }, status: 422
    end
  end

  private

  def find_board
    @board = Board.friendly.find(params[:board_id])
  end
end
