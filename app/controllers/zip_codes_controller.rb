class ZipCodesController < ApplicationController
  before_action :set_zip_code, only: [:show, :update, :destroy]

  # GET /zip_codes
  def index
    @zip_codes = ZipCode.all

    render json: @zip_codes
  end

  # GET /zip_codes/1
  def show
    render json: @zip_code
  end

  # POST /zip_codes
  def create
    @zip_code = ZipCode.new(zip_code_params)

    if @zip_code.save
      render json: @zip_code, status: :created, location: @zip_code
    else
      render json: @zip_code.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /zip_codes/1
  def update
    if @zip_code.update(zip_code_params)
      render json: @zip_code
    else
      render json: @zip_code.errors, status: :unprocessable_entity
    end
  end

  # DELETE /zip_codes/1
  def destroy
    @zip_code.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zip_code
      @zip_code = ZipCode.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def zip_code_params
      params.require(:zip_code).permit(:value)
    end
end
