class UsersController < ApplicationController
  # GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end
end
