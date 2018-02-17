class Board::CardsController < ::AuthorizedController

  def create
    builder = Builder::Card.new(permitted_params.card)
    if builder.save
      render json: { card: CardSerializer.new(builder.card) }, status: 201
    else
      render json: { errors: builder.card.errors.full_messages }, status: 422
    end
  end

end
