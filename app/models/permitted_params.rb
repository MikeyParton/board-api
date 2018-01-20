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
end
