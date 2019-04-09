class UsersController < ApplicationController
  # GET /users
  def index
    @users = User.all
    json_response(@users)
  end

  # GET /users/:id
  def show
    @user = User.find(params[:id])
    json_response(@user)
  end

 # DELETE /users/:id
  def destroy
    @user = User.find(params[:id])

    @user.destroy

    head :no_content
  end

  private
  def user_params
    params.permit(:name, :email, :password, :access_level)
  end
end
