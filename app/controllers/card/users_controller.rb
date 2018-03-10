class Card::UsersController < ::AuthorizedController
  before_action :find_card

  def index
    users = @card.board.users
    render json: { users: users.map { |u|  UserSerializer.new(u) } }, status: 200
  end

  def find_card
    @card = Card.find(params[:card_id])
  end
end
