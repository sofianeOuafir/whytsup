class UsersController < ApplicationController
  wrap_parameters :user, include: [:name, :email, :password, :password_confirmation]
  skip_before_action :authenticate_request, only: :create

  def create
    user = User.create(user_params)
    if user.valid?
      command = AuthenticateUser.call(params[:email], params[:password])
 
      if command.success?
        token = command.result[:token]
        cookies.signed[:jwt] = { value: token, httponly: true }
        render json: { auth_token: token, user: command.result[:user] }
      end
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
