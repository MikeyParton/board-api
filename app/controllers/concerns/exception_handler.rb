module ExceptionHandler
  extend ActiveSupport::Concern

   # Define custom error subclasses - rescue catches `StandardErrors`
  class AuthenticationError < StandardError; end
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end
  class ExpiredSignature < StandardError; end
  class DecodeError < StandardError; end

  included do
    # Define custom handlers
    rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two
    rescue_from ExceptionHandler::AuthenticationError, with: :four_zero_one
    rescue_from ExceptionHandler::MissingToken, with: :four_twenty_two
    rescue_from ExceptionHandler::InvalidToken, with: :four_twenty_two
    rescue_from ExceptionHandler::ExpiredSignature, with: :four_ninety_eight
    rescue_from ExceptionHandler::DecodeError, with: :four_zero_one

    rescue_from ActiveRecord::RecordNotFound do |e|
     render json: { error: e.message }, status: 404
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      render json: { error: e.message }, status: 422
    end
  end

  private

  # JSON response with message; Status code 422 - unprocessable entity
  def four_twenty_two(e)
   render json: { error: e.message }, status: 422
  end

# JSON response with message; Status code 401 - Unauthorized
  def four_ninety_eight(e)
    render json: { error: e.message }, status: 498
  end

  # JSON response with message; Status code 401 - Unauthorized
  def four_zero_one(e)
    render json: { error: e.message }, status: 401
  end
end
