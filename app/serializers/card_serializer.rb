class CardSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :list_id,
             :board_slug,
             :url,
             :users,
             :labels

  # by overriding the attributes method, optional attributes can be defined
  # https://stackoverflow.com/questions/29705802/conditional-attributes-in-active-model-serializers/40069173
  def attributes(*args)
   hash = super
   if @instance_options[:detailed] == true
     hash[:checklists] = checklists
     hash[:current_timer] = current_timer
   end
   hash
  end

  def checklists
    ActiveModelSerializers::SerializableResource.new(
      object.checklists,
      each_serializer: ChecklistSerializer
    )
  end

  def users
    ActiveModelSerializers::SerializableResource.new(
      object.users,
      each_serializer: UserSerializer
    )
  end

  def labels
    ActiveModelSerializers::SerializableResource.new(
      object.labels,
      each_serializer: LabelSerializer
    )
  end

  def board_slug
    object.board.slug
  end

  def url
    "/c/#{object.slug}/#{object.number}-#{object.name.downcase.split(' ').join('-')}"
  end

  def current_timer
    return nil if object.current_timer.blank?
    TimerSerializer.new(object.current_timer)
  end
end
