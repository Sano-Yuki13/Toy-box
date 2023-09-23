class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @favorites = @user.favorites.page(params[:page]).per(10)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def search
    @users = User.all.search(params[:keyword])
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
