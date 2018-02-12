class ListsController < AuthorizedController
  before_action :find_list

  def update
    if @list.update(permitted_params.list)
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

  def find_list
    @list = List.find(params[:id])
  end
end
