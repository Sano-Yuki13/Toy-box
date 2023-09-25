class Admin::UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to admin_users_path
  end
end
