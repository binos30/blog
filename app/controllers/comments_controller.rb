# frozen_string_literal: true

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

    if @comment.user.id == current_user.id
      @comment.destroy
    else
      flash[:warning] = "Not Authorized"
    end

    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end
end
