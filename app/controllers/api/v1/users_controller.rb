class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def index
    users = User.all
    render json:users
  end

  def show
    user = User.find(params[:id])
    render json:user
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token(user_id: @user.id)
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: 'Unable to create user' }, status: :not_acceptable
    end
  end

  def profile
    # byebug
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

    private

  def user_params
    params.require(:user).permit(:name, :username, :password, :bio, :avatar)
  end

end
