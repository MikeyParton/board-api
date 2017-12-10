class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :board_id, :cards

  def cards
    ActiveModelSerializers::SerializableResource.new(
      object.cards,
      each_serializer: CardSerializer
    )
  end
end
