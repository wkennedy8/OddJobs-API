class ContractorImagesController < ApplicationController
  before_action :set_contractor_image, only: [:show, :update, :destroy]

  # GET /contractor_images
  def index
    @contractor_images = ContractorImage.all

    render json: @contractor_images
  end

  # GET /contractor_images/1
  def show
    render json: @contractor_image
  end

  # POST /contractor_images
  def create
    @contractor_image = ContractorImage.new(contractor_image_params)

    if @contractor_image.save
      render json: @contractor_image, status: :created, location: @contractor_image
    else
      render json: @contractor_image.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contractor_images/1
  def update
    if @contractor_image.update(contractor_image_params)
      render json: @contractor_image
    else
      render json: @contractor_image.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contractor_images/1
  def destroy
    @contractor_image.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contractor_image
      @contractor_image = ContractorImage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def contractor_image_params
      params.require(:contractor_image).permit(:url, :contractor_id)
    end
end
