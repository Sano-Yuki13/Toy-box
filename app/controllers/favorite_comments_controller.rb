class FavoriteCommentsController < ApplicationController

  def create
    favorite = Favorite.find(params[:favorite_id])
    comment = current_user.favorite_comments.new(favorite_comment_params)
    comment.favorite_id = favorite.id
    if comment.save
     redirect_to favorite_path(favorite)
    else
     flash[:alert] = "文字を入力してください"
     redirect_to favorite_path(favorite)
    end
  end

  def destroy
    FavoriteComment.find(params[:id]).destroy
    redirect_to favorite_path(params[:favorite_id])
  end

  private

  def favorite_comment_params
    params.require(:favorite_comment).permit(:comment)
  end
end
