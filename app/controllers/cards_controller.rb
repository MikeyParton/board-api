class CardsController < AuthorizedController
  before_action :find_card

  def show
    render json: { cards: [CardSerializer.new(@card, detailed: true)] }, status: 200
  end

  def update
    if @card.update(permitted_params.card)
      render json: { cards: [CardSerializer.new(@card)] }, status: 200
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

  def add_user
    user = User.find_by(id: params[:user_id])
    @card.users << user if user.present?
    render json: { cards: [CardSerializer.new(@card)] }, status: 200
  end

  def remove_user
    card_user = @card.card_users.find_by(user_id: params[:user_id])
    card_user.destroy if card_user.present?
    render json: { cards: [CardSerializer.new(@card)] }, status: 200
  end

  private

  def find_card
    @card = Card.friendly.find(params[:id])
  end
end
