class UsersController < ApplicationController
  def signup
    form = SignupForm.new(permitted_params.signup)
    if form.save
      render json: {
        user: UserSerializer.new(form.user),
        token: form.token,
      }, status: 201
    else
      render json: { error: form.errors }, status: 422
    end
  end

  def login
    form = LoginForm.new(permitted_params.login)
    if form.save
      render json: {
        user: UserSerializer.new(form.user),
        token: form.token,
      }, status: 201
    else
      render json: { error: form.errors }, status: 422
    end
  end
end
