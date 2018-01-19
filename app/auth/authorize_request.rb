class AuthorizeRequest
  attr_reader :headers

  def initialize(headers = {})
    @headers = headers
  end

  def process
    User.find_by_id(decoded_token[:user_id])
  end

  private

  def decoded_token
    JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    return nil unless headers['Authorization'].present?
    headers['Authorization'].split(' ').last
  end
end
