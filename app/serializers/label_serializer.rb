class LabelSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :color,
             :code
end
