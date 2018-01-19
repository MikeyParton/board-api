class UsersController < ApplicationController
  def login
    token = AuthenticateUser.new(params[:email], params[:password]).process
    if token.present?
      render json: { token: token }, status: 201
    else
      render json: { error: 'Invalid email or password' }, status: 401
    end
  end
end
