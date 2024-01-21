class TagsController < ApplicationController
  before_action :set_tag, only: %i[ show update destroy ]

  # GET /tags
  def index
    @tags = Tag.all

    render json: @tags
  end

  # GET /tags/1
  def show
    @tag = Tag.includes(:articles).find(params[:id]);
    render json: @tag.as_json(include: :articles)
  end

  # POST /tags
  def create
    @json_data = JSON.parse(request.body.read)
    @tag = Tag.new(@json_data)

    if @tag.save
      render json: @tag, status: :created, location: @tag
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tags/1
  def update
    if @tag.update(tag_params)
      render json: @tag
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tags/1
  def destroy
    @tag.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tag_params
      params.permit(:tag_name, :string)
    end
end
