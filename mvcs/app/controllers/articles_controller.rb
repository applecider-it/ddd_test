class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  # GET /articles or /articles.json
  def index
    list_service = ArticleServices::ListService.new

    @articles = list_service.get_articles
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)

    if @article.valid?
      @article.save

      redirect_to @article, notice: "Article was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    @article.assign_attributes(article_params)

    if @article.valid?
      @article.save

      redirect_to @article, notice: "Article was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy!

    redirect_to articles_path, notice: "Article was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.expect(article: [ :title, :content ])
    end
end
