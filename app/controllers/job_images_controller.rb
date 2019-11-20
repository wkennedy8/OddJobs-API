class JobImagesController < ApplicationController
  before_action :set_job_image, only: [:show, :update, :destroy]

  # GET /job_images
  def index
    @job_images = JobImage.all

    render json: @job_images
  end

  # GET /job_images/1
  def show
    render json: @job_image
  end

  # POST /job_images
  def create
    @job_image = JobImage.new(job_image_params)

    if @job_image.save
      render json: @job_image, status: :created, location: @job_image
    else
      render json: @job_image.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /job_images/1
  def update
    if @job_image.update(job_image_params)
      render json: @job_image
    else
      render json: @job_image.errors, status: :unprocessable_entity
    end
  end

  # DELETE /job_images/1
  def destroy
    @job_image.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_image
      @job_image = JobImage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def job_image_params
      params.require(:job_image).permit(:url, :job_posting_id)
    end
end
