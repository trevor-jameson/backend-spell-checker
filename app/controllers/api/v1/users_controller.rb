class Api::V1::UsersController < ApplicationController
  # Will check that json token is provided in header on all methods but create user
  skip_before_action :authorized, only: [:create]

  def create
    @user = User.create(new_user_params)
    if @user.valid?
      # Encodes user_id as JWT with app secret key and bundles with response
      @token = encode_token(user_id: @user.id)
      render json: {user: UserSerializer.new(@user), jwt: @token}, status: :created
    else
      render json: { error: @user.errors.full_messages}, status: :not_acceptable
    end
  end

private

  def new_user_params
    params.(:user)require.permit(:username, :password)
  end
  # End of Users Controller
end
