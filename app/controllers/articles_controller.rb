class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /articles
  def index
    @articles = Article.all
  end

  # GET /articles/1
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # POST /articles
  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  # GET /articles/1/edit
  def edit
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy

    redirect_to root_path
  end

  def correct_user
    @article = current_user.articles.find_by(id: params[:id])
    if @article.nil?
      redirect_to articles_path
      flash[:warning] = "Not Authorized"
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions
  def set_article
    @article = Article.find(params[:id])
  end

  # Only allow a list of trusted parameters through
  def article_params
    params.require(:article).permit(:title, :body, :status)
  end
end
