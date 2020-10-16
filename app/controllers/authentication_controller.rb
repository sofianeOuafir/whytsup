class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request, only: :authenticate
 
  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])
 
    if command.success?
      token = command.result[:token]
      cookies.signed[:jwt] = { value: token, httponly: true }
      render json: { auth_token: token, user: command.result[:user] }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  def auto_login
    render json: current_user
  end
 end