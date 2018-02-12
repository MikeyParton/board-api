class ChecklistSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :checklist_items

  def checklist_items
    ActiveModelSerializers::SerializableResource.new(
      object.checklist_items,
      each_serializer: ChecklistItemSerializer
    )
  end
end
