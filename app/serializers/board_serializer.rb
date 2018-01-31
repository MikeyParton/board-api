class BoardSerializer < ActiveModel::Serializer
  attributes :id, :name, :slug, :lists

  def lists
    ActiveModelSerializers::SerializableResource.new(
      object.lists,
      each_serializer: ListSerializer
    )
  end
end
