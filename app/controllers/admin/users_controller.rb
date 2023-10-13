class Admin::UsersController < ApplicationController
  
  before_action :authenticate_admin!
  
  
  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to admin_users_path
  end
end
