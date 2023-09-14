class FavoritesController < ApplicationController
  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.new(favorite_params)
    @favorite.user_id = current_user.id
    @favorite.save
    redirect_to favorites_path
  end

  def index
    @favorites = Favorite.all
  end

  def show
    @favorite = Favorite.find(params[:id])
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy
    redirect_to favorites_path
  end

  private

  def favorite_params
    params.require(:favorite).permit(:title, :tag, :body)
  end
end
