class FavoriteCommentsController < ApplicationController

  def create
    favorite = Favorite.find(params[:favorite_id])
    comment = current_user.favorite_comments.new(favorite_comment_params)
    comment.favorite_id = favorite.id
    comment.save
    redirect_to favorite_path(favorite)
  end

  private

  def favorite_comment_params
    params.require(:favorite_comment).permit(:comment)
  end
end
