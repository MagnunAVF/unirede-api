class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]

  # GET /users
  def index
    @users = User.all
    json_response(@users)
  end

  # GET /users/:id
  def show
    json_response(@user)
  end

 # DELETE /users/:id
  def destroy
    @user.destroy

    head :no_content
  end

  # POST /users
  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end

  private
  def user_params
    params.permit(:name, :email, :password, :access_level)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
