class BoardSerializer < ActiveModel::Serializer
  attributes :id, :name, :lists

  def lists
    ActiveModelSerializers::SerializableResource.new(
      object.lists,
      each_serializer: ListSerializer
    )
  end
end
