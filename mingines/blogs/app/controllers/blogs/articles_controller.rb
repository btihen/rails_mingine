class Blogs::ArticlesController < ApplicationController
  before_action :set_blogs_article, only: %i[ show edit update destroy ]

  # GET /blogs/articles or /blogs/articles.json
  def index
    @blogs_articles = Blogs::Article.all
  end

  # GET /blogs/articles/1 or /blogs/articles/1.json
  def show
  end

  # GET /blogs/articles/new
  def new
    @blogs_article = Blogs::Article.new
  end

  # GET /blogs/articles/1/edit
  def edit
  end

  # POST /blogs/articles or /blogs/articles.json
  def create
    @blogs_article = Blogs::Article.new(blogs_article_params)

    respond_to do |format|
      if @blogs_article.save
        format.html { redirect_to article_url(@blogs_article), notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @blogs_article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blogs_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/articles/1 or /blogs/articles/1.json
  def update
    respond_to do |format|
      if @blogs_article.update(blogs_article_params)
        format.html { redirect_to article_url(@blogs_article), notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @blogs_article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blogs_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/articles/1 or /blogs/articles/1.json
  def destroy
    @blogs_article.destroy!

    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blogs_article
      @blogs_article = Blogs::Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blogs_article_params
      params.require(:article).permit(:title, :body, :blogs_user_id)
    end
end
