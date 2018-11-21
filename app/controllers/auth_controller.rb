class AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]

# User login
def create
  @user = User.find_by(username: user_login_params[:username])
  # User#authenticate coems from BCrypt
  # If @user is not found, the && will short circuit and not evaluate auth
  if @user && @user.authenticate(user_login_params[:password])
    token = encode_token({user_id: @user.id})
    render json: { user: UserSerializer.new(@user), jwt: token}, status: :accepted
  else
    render json: { message: 'Invalid username or password' }, status: :unauthorized
  end
end

private
  def user_login_params
  params.require(:user).permit(:username, :password)
  end
# End of Auth Controller
end
