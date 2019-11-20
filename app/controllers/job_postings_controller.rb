class JobPostingsController < ApplicationController
  before_action :set_job_posting, only: [:show, :update, :destroy]

  # GET /job_postings
  def index
    @job_postings = JobPosting.all

    render json: @job_postings
  end

  # GET /job_postings/1
  def show
    render json: @job_posting
  end

  # POST /job_postings
  def create
    @job_posting = JobPosting.new(job_posting_params)

    if @job_posting.save
      render json: @job_posting, status: :created, location: @job_posting
    else
      render json: @job_posting.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /job_postings/1
  def update
    if @job_posting.update(job_posting_params)
      render json: @job_posting
    else
      render json: @job_posting.errors, status: :unprocessable_entity
    end
  end

  # DELETE /job_postings/1
  def destroy
    @job_posting.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_posting
      @job_posting = JobPosting.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def job_posting_params
      params.require(:job_posting).permit(:title, :description, :job_category_id, :contract_id, :user_profile_id)
    end
end
