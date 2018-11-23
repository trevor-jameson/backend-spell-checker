class AuthController < ApplicationController
  # skip_before_action :authorized, only: [:create]

# User login
def create
  @user = User.find_by(username: user_login_params[:username])

  # If @user is not found, the && will short circuit and not evaluate auth
  if @user && @user.authenticate(user_login_params[:password])
    token = encode_token({user_id: @user.id})

    # Return JSON object with user and jwt elems
    # Limit user to username, firstname, and pic for security
    render json: { user: UserSerializer.new(@user), jwt: token}, status: :accepted
  else
    render json: { message: 'Invalid username or password' }, status: :unauthorized
  end
end

# User logout
def destroy
  # :authorized method before action will validate the user's token.
  @user = User.find(current_user)

  # How should the JWT be revoked?
  render json: { message: 'You have been logged out successfully', jwt: token}, status: :accepted
end

private

def user_login_params
  params.require(:user).permit(:username, :password)
end
# End of Auth Controller
end
