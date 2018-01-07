class CardSerializer < ActiveModel::Serializer
  attributes :id, :name, :list_id, :board_id

  def board_id
    object.board.id
  end
end
