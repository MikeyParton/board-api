class CardSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :list_id,
             :slug,
             :board_slug

  # by overriding the attributes method, optional attributes can be defined
  # https://stackoverflow.com/questions/29705802/conditional-attributes-in-active-model-serializers/40069173
  def attributes(*args)
   hash = super
   if @instance_options[:detailed] == true
     hash[:checklists] = checklists
   end
   hash
  end

  def checklists
    ActiveModelSerializers::SerializableResource.new(
      object.checklists,
      each_serializer: ChecklistSerializer
    )
  end

  def board_slug
    object.board.slug
  end
end
