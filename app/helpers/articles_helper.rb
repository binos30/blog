module ArticlesHelper
  def article_author?
    if user_signed_in?
      @article.user_id == current_user.id
    end
  end
end
