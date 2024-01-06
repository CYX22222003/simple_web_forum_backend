class PostsController < ApplicationController
  before_action :set_post, only: %i[ show update destroy ]

  # GET /posts
  def index
    @posts = Post.all
    response.headers["Content-Type"]="application/json"
    response.headers["Accept"]="application/json"
    response.headers["Access-Control-Allow-Origin"]="*"
    response.headers["X-Content-Type-Options"]="nosniff"
    render json: @posts
  end

  # GET /posts/1
  def show
    response.headers["Content-Type"]="application/json"
    response.headers["Accept"]="application/json"
    response.headers["Access-Control-Allow-Origin"]="*"
    response.headers["X-Content-Type-Options"]="nosniff"
    render json: @post
  end

  # POST /posts
  def create
    @json_data = JSON.parse(request.body.read)
    @post = Post.new(@json_data)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post = Post.find(params[:id])
    if @article
      @article.destroy
      render json: @article, status: 200
    else
      render json: {"error": "unable to delete"}, status: 400
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.permit(:title, :body)
    end
end
