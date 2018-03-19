class Card::BaseController < ::AuthorizedController
  before_action :find_card

  def find_card
    @card = Card.find(params[:card_id])
  end
end
