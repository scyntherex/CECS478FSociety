class AuthenticationController < ApplicationController
  def authenticate_user
    user = User.find_for_database_authentication(email: params[:email])
    if user.valid_password?(params[:password])
      render json: payload(user)
    else
      render json: {errors: ['Invalid Username/Password']}, status: :unauthorized
    end
  end

  def register_user
    user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if user.id == nil
      render json: {errors: ['Info missing or User exists']}, status: :unauthorized
    else
      render json: "{user created}"
    end
  end
  
  private

  def payload(user)
    return nil unless user and user.id
    {
      auth_token: JsonWebToken.encode({user_id: user.id}),
      user: {id: user.id, email: user.email}
    }
  end

end