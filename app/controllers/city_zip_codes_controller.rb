class CityZipCodesController < ApplicationController
  before_action :set_city_zip_code, only: [:show, :update, :destroy]

  # GET /city_zip_codes
  def index
    @city_zip_codes = CityZipCode.all

    render json: @city_zip_codes
  end

  # GET /city_zip_codes/1
  def show
    render json: @city_zip_code
  end

  # POST /city_zip_codes
  def create
    @city_zip_code = CityZipCode.new(city_zip_code_params)

    if @city_zip_code.save
      render json: @city_zip_code, status: :created, location: @city_zip_code
    else
      render json: @city_zip_code.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /city_zip_codes/1
  def update
    if @city_zip_code.update(city_zip_code_params)
      render json: @city_zip_code
    else
      render json: @city_zip_code.errors, status: :unprocessable_entity
    end
  end

  # DELETE /city_zip_codes/1
  def destroy
    @city_zip_code.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city_zip_code
      @city_zip_code = CityZipCode.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def city_zip_code_params
      params.require(:city_zip_code).permit(:city_id, :zip_code_id)
    end
end
