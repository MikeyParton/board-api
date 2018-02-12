class Board::CardsController < ::AuthorizedController

  def create
    @card = Card.new(permitted_params.card)
    if @card.save
      render json: { card: CardSerializer.new(@card) }, status: 201
    else
      render json: { errors: @card.errors.full_messages }, status: 422
    end
  end

end
