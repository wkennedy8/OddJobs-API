class UserImagesController < ApplicationController
  before_action :set_user_image, only: [:show, :update, :destroy]

  # GET /user_images
  def index
    @user_images = UserImage.all

    render json: @user_images
  end

  # GET /user_images/1
  def show
    render json: @user_image
  end

  # POST /user_images
  def create
    @user_image = UserImage.new(user_image_params)

    if @user_image.save
      render json: @user_image, status: :created, location: @user_image
    else
      render json: @user_image.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_images/1
  def update
    if @user_image.update(user_image_params)
      render json: @user_image
    else
      render json: @user_image.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_images/1
  def destroy
    @user_image.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_image
      @user_image = UserImage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_image_params
      params.require(:user_image).permit(:url, :user_profile_id)
    end
end
