class ChecklistItemSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :status,
             :timer_id
end
