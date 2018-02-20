class Card::ChecklistsController < AuthorizedController
  before_action :find_card

  def create
    checklist = @card.checklists.new(permitted_params.checklist.merge({
      creator: current_user
    }))

    binding.pry
    if checklist.save
      render json: { checklist: ChecklistSerializer.new(checklist) }
    else
      render json: { error: checklist.errors }, status: 422
    end
  end

  private

  def find_card
    @card = Card.find(params[:card_id])
  end
end
