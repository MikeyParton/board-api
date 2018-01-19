class AuthenticateUser
  attr_reader :email, :password

  def initialize(email, password)
    @email = email
    @password = password
  end

  def process
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  def user
    user = User.find_by(email: email)
    return user if user && user.authenticate(password)
    nil
  end
end
