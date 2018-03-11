class PermittedParams < Struct.new(:params)
  def signup
    valid_keys = [
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    ]
    params.permit(*valid_keys)
  end

  def login
    valid_keys = [:email, :password]
    params.permit(*valid_keys)
  end

  def list
    valid_keys = [:name]
    params.permit(*valid_keys)
  end

  def card
    valid_keys = [:name, :list_id]
    params.permit(*valid_keys)
  end

  def checklist
    valid_keys = [:name, :card_id]
    params.permit(*valid_keys)
  end

  def checklist_item
    valid_keys = [:name, :checklist_id]
    params.permit(*valid_keys)
  end

  def label
    valid_keys = [:name, :color]
    params.permit(*valid_keys)
  end
end
