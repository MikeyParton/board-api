class BoardSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :slug,
             :url

  # by overriding the attributes method, optional attributes can be defined
  # https://stackoverflow.com/questions/29705802/conditional-attributes-in-active-model-serializers/40069173
  def attributes(*args)
   hash = super
   if @instance_options[:detailed] == true
     hash[:lists] = lists
     hash[:users] = users
     hash[:labels] = labels
   end
   hash
  end

  def lists
    ActiveModelSerializers::SerializableResource.new(
      object.lists,
      each_serializer: ListSerializer
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

  def url
    "/b/#{object.slug}/#{object.number}-#{object.name.downcase.split(' ').join('-')}"
  end
end
