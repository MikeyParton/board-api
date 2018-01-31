class Board::CardsController < ::AuthorizedController
  before_action :find_card, only: [:show, :update, :destroy, :reorder]

  def show
    render json: { card: CardSerializer.new(@card) }, status: 200
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      render json: { card: CardSerializer.new(@card) }, status: 201
    else
      render json: { errors: @card.errors.full_messages }, status: 422
    end
  end

  def update
    if @card.update(card_params)
      render json: { card: CardSerializer.new(@card) }, status: 200
    else
      render json: { errors: @card.errors.full_messages }, status: 422
    end
  end

  def destroy
    if @card.destroy
      render json: {}, status: 200
    else
      render json: { errors: @card.errors.full_messages }, status: 422
    end
  end

  def reorder
    reorder = Reorder.new(
      list_item: list,
      parent_key: "list_id",
      parent_id: params[:parent_id],
      position: params[:position]
    )

    return render json: {}, status: 200
  end

  private

  def find_card
    @card = Card.friendly.find(id: params[:id])
  end

  def card_params
    params.require(:card).permit(:name, :list_id)
  end
end
