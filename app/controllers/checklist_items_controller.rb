class ChecklistItemsController < AuthorizedController
  before_action :find_checklist_item

  def complete
    @checklist_item.completed_by = current_user
    if @checklist_item.complete!
      render json: { checklist_items: [ChecklistItemSerializer.new(@checklist_item)] }, status: 200
    else
      render json: { errors: @checklist_item.errors }, status: 422
    end
  end

  def undo
    @checklist_item.completed_by = nil
    if @checklist_item.undo!
      render json: { checklist_items: [ChecklistItemSerializer.new(@checklist_item)] }, status: 200
    else
      render json: { errors: @checklist_item.errors }, status: 422
    end
  end

  private

  def find_checklist_item
    @checklist_item = ChecklistItem.find(params[:id])
  end
end
