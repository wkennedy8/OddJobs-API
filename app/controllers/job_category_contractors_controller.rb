class JobCategoryContractorsController < ApplicationController
  before_action :set_job_category_contractor, only: [:show, :update, :destroy]

  # GET /job_category_contractors
  def index
    @job_category_contractors = JobCategoryContractor.all

    render json: @job_category_contractors
  end

  # GET /job_category_contractors/1
  def show
    render json: @job_category_contractor
  end

  # POST /job_category_contractors
  def create
    @job_category_contractor = JobCategoryContractor.new(job_category_contractor_params)

    if @job_category_contractor.save
      render json: @job_category_contractor, status: :created, location: @job_category_contractor
    else
      render json: @job_category_contractor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /job_category_contractors/1
  def update
    if @job_category_contractor.update(job_category_contractor_params)
      render json: @job_category_contractor
    else
      render json: @job_category_contractor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /job_category_contractors/1
  def destroy
    @job_category_contractor.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_category_contractor
      @job_category_contractor = JobCategoryContractor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def job_category_contractor_params
      params.require(:job_category_contractor).permit(:job_category_id, :contractor_id)
    end
end
