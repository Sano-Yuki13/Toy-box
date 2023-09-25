class Admin::FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all.page(params[:page]).per(10)
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy
    redirect_to favorites_path
  end
end
