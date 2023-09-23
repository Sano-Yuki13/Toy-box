class FavoritesController < ApplicationController
  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.new(favorite_params)
    @favorite.user_id = current_user.id
    if @favorite.save
     redirect_to favorites_path
    else
      flash[:alert] = "文字を入力、または選択してください"
      render :new
    end
  end

  def index
    @favorites = Favorite.published.page(params[:page]).per(10)
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

  def search
    @favorites = Favorite.all.search(params[:keyword])
  end

  def index_user
    @favorite = Favorite.where(user_id:params[:id]).where(status:true).page(params[:page]).per(10)
  end

  private

  def favorite_params
    params.require(:favorite).permit(:title, :tag, :body, :status)
  end
end
