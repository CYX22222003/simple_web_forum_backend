# configure headers to enable CORS
# headers: {
#   'Accept': 'application/json',
#   'Content-Type': 'application/json',
#   "Access-Control-Allow-Origin": "*",
#   "X-Content-Type-Options": "nosniff"
# }

class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show update destroy ]

  # GET /articles
  def index
    @articles = Article.all
    response.headers["Content-Type"]="application/json"
    response.headers["Accept"]="application/json"
    response.headers["Access-Control-Allow-Origin"]="*"
    response.headers["X-Content-Type-Options"]="nosniff"

    render json: @articles
  end

  # GET /articles/1
  def show
    response.headers["Content-Type"]="application/json"
    response.headers["Accept"]="application/json"
    response.headers["Access-Control-Allow-Origin"]="*"
    response.headers["X-Content-Type-Options"]="nosniff"

    render json: @article
  end

  # POST /articles
  def create
    @json_data = JSON.parse(request.body.read)
    @article = Article.new(@json_data)

    if @article.save
      render json: @article, status: :created, location: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  def destroy
    @article = Article.find(params[:id])
    if @article
      @article.destroy
      render json: @article, status: 200
    else
      render json: {"error": "unable to delete"}, status: 400
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.permit(:title, :body)
    end
end
