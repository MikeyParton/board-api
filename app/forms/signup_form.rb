class SignupForm < BaseForm
  attr_accessor(
    :first_name,
    :last_name,
    :email,
    :password,
    :password_confirmation
  )

  attr_reader(
    :user,
    :account,
    :token
  )

  validates :first_name, :last_name, :password, :password_confirmation, :email, presence: true
  validate :passwords_match
  validate :unique_email

  def persist!
    @user = User.create(user_params)
    @account = Account.create(owner: @user)
    @token = JsonWebToken.encode(user_id: user.id)
  end

  private

  def user_params
    {
      first_name: first_name,
      last_name: last_name,
      email: email,
      password: password
    }
  end

  def passwords_match
    return if password == password_confirmation
    errors.add(:password_confirmation, "Passwords must match")
  end

  def unique_email
    return unless User.find_by(email: email)
    errors.add(:email, "Email must be unique")
  end
end
