class Admin::FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy
    redirect_to favorites_path
  end
end
