class ListsController < ActionController::API
  before_action :find_list, only: [:show, :update, :destroy]
  before_action :find_board, only: [:create]

  def index
    @lists = List.all.includes(:cards)
    render json: ActiveModelSerializers::SerializableResource.new(@lists, each_serializer: ListSerializer).to_json, status: 200
  end

  def show
    render json: @list, status: 200
  end

  def create
    @list = List.new(list_params)
    if @list.save
      render json: @list, status: 201
    else
      render json: { errors: @list.errors.full_messages }, status: 422
    end
  end

  def update
    if @list.update(list_params)
      render json: @list, status: 201
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
    @board = List.find_by(id: params[:list][:board_id])
    return render json: { errors: 'Board not found' }, status: 404 unless @board.present?
  end

  def find_list
    @list = List.find_by(id: params[:id])
    return render json: { errors: 'List not found' }, status: 404 unless @list.present?
  end

  def list_params
    params.require(:list).permit(:name, :board_id)
  end
end
