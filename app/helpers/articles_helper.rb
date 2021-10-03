# frozen_string_literal: true

module ArticlesHelper
  def article_author?(article)
    return false unless user_signed_in?

    article.user_id == current_user.id
  end
end
