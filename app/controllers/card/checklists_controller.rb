class Card::ChecklistsController < ::Card::BaseController
  def create
    checklist = @card.checklists.new(permitted_params.checklist.merge({
      creator: current_user
    }))

    if checklist.save
      render json: { checklist: ChecklistSerializer.new(checklist) }
    else
      render json: { error: checklist.errors }, status: 422
    end
  end
end
