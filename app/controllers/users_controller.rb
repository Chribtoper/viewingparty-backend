class UsersController < ApplicationController
  def index
    users = User.all
    render json:users
  end

  def show
    user = User.find(params[:id])
    render json:user
  end

  def create
    user = User.create(user_params)
    # ActionCable.server.broadcast "room_#{user.room_id}", { title: 'New User', body: user }
    render json: user, status: 201
  end

  private
  def user_params
    params.permit(:name)
  end

end
