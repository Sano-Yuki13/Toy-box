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
    @favorites = Favorite.published
  end

  def show
    @favorite = Favorite.find(params[:id])
    @favorite_comment = FavoriteComment.new
  end

  def edit
    @favorite = Favorite.find(params[:id])
  end

  def update
    @favorite = Favorite.find(params[:id])
    @favorite.update(favorite_params)
    redirect_to favorite_path(@favorite.id)
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy
    redirect_to favorites_path
  end

  private

  def favorite_params
    params.require(:favorite).permit(:title, :tag, :body, :status)
  end
end
