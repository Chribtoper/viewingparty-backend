class Api::V1::UsersController < ApplicationController
  def index
    users = User.all
    render json:users
  end

  def show
    user = User.find(params[:id])
    render json:user
  end

  def create
    # ActionCable.server.broadcast "room_#{user.room_id}", { title: 'New User', body: user }
    @user = User.create(user_params)
      if @user.valid?
        render json: { user: UserSerializer.new(@user) }, status: :created
      else
        render json: { error: 'failed to create user' }, status: :not_acceptable
      end
  end



  private
  def user_params
    params.require(:user).permit(:name, :username, :password, :bio, :avatar)
  end

end
