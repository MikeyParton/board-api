class ApplicationController < ActionController::API
  include ExceptionHandler
  attr_reader :current_user

  private

  def authorize_request
    @current_user = AuthorizeRequest.new(request.headers).process
    ExceptionHandler::AuthenticationError unless @current_user.present?
  end

  def permitted_params
    @permitted_params ||= PermittedParams.new(params)
  end
end
