class ChecklistsController < AuthorizedController
  before_action :find_checklist

  def update
    if @checklist.update(permitted_params.checklist)
      render json: { checklist: ChecklistSerializer.new(@checklist) }
    else
      render json: { error: @checklist.errors }, status: 422
    end
  end

  private

  def find_checklist
    @checklist = Checklist.find(params[:id])
  end
end
