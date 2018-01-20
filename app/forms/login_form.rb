class LoginForm < BaseForm
  attr_accessor(
    :email,
    :password
  )

  attr_reader(
    :user,
    :token
  )

  validate :credentials_valid

  private

  def persist!
    @token = JsonWebToken.encode(user_id: user.id)
  end

  def credentials_valid
    @user = User.find_by(email: email)
    return if @user.try(:authenticate, password)
    errors.add(:base, 'Email or password invalid')
  end
end
