class EmailsController < ApplicationController
  before_action :set_email, only: %i[ show update destroy ]

  # GET /emails
  def index
    @emails = Email.all

    render json: @emails
  end

  # GET /emails/1
  def show
    @email = Email.includes(:users,:articles,:comments).find(params[:id]);
    render json: @email.as_json(include: :users)
  end

  # POST /emails
  def create
    @json_data = JSON.parse(request.body.read)
    @email = Email.new(@json_data)


    if @email.save
      render json: @email, status: :created, location: @email
    else
      render json: @email.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /emails/1
  def update
    if @email.update(email_params)
      render json: @email
    else
      render json: @email.errors, status: :unprocessable_entity
    end
  end

  # DELETE /emails/1
  def destroy
    @email.destroy!
  end

  # SHOW /emails/articles/1
  def showArticles
    @email = Email.includes(:articles).find(params[:id]);
    render json: @email.as_json(include: :articles)
  end
  
  # SHOW /emails/comments/1
  def showComments
    @email = Email.includes(:comments).find(params[:id]);
    render json: @email.as_json(include: :comments);
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @email = Email.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def email_params
      params.permit(:address)
    end
end
