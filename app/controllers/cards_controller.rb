class CardsController < ActionController::API
  before_action :find_card, only: [:show, :update, :destroy]
  before_action :find_list, only: [:create]

  def index
    @cards = Card.all
    render json: { cards: @cards.map { |c| CardSerializer.new(c) } }, status: 200
  end

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

  private

  def find_list
    @list = Card.find_by(id: params[:card][:list_id])
    return render json: { errors: 'List not found' }, status: 404 unless @list.present?
  end

  def find_card
    @card = Card.find_by(id: params[:id])
    return render json: { errors: 'Card not found' }, status: 404 unless @card.present?
  end

  def card_params
    params.require(:card).permit(:name, :list_id)
  end
end
