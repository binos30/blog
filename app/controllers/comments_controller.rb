class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)

    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])

    unless @comment.user.id == current_user.id
      flash[:warning] = "Not Authorized"
    else
      @comment.destroy
    end

    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end
end
