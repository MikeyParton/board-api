class CardSerializer < ActiveModel::Serializer
  attributes :id, :name, :list_id, :slug, :board_slug

  def board_slug
    object.board.slug
  end
end
