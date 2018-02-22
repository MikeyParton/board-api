class Checklist::ChecklistItemsController < AuthorizedController
  before_action :find_checklist

  def create
    checklist_item = @checklist.checklist_items.new(permitted_params.checklist_item.merge({
      creator: current_user
    }))
    if checklist_item.save
      render json: { checklistItems: [ChecklistItemSerializer.new(checklist_item)] }
    else
      render json: { error: checklist_item.errors }, status: 422
    end
  end

  private

  def find_checklist
    @checklist = Checklist.find(params[:checklist_id])
  end
end
