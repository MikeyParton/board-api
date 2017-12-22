class Reorder
  def initialize(list_item:, parent_key:, parent_id:, position:)
    @list_item  = list_item
    @parent_key = parent_key
    @parent_id  = parent_id
    @position   = position
  end

  def process
    maybe_change_parent
    @list_item.insert_at(@position)
  end

  def maybe_change_parent
    return if @list_item.send(@parent_key) == @parent_id
    @list_item.remove_from_list
    @list_item.send("#{@parent_key}=", @parent_id)
    @list_item.save
  end
end
