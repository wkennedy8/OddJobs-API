require 'test_helper'

class CityZipCodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @city_zip_code = city_zip_codes(:one)
  end

  test "should get index" do
    get city_zip_codes_url, as: :json
    assert_response :success
  end

  test "should create city_zip_code" do
    assert_difference('CityZipCode.count') do
      post city_zip_codes_url, params: { city_zip_code: { city_id: @city_zip_code.city_id, zip_code_id: @city_zip_code.zip_code_id } }, as: :json
    end

    assert_response 201
  end

  test "should show city_zip_code" do
    get city_zip_code_url(@city_zip_code), as: :json
    assert_response :success
  end

  test "should update city_zip_code" do
    patch city_zip_code_url(@city_zip_code), params: { city_zip_code: { city_id: @city_zip_code.city_id, zip_code_id: @city_zip_code.zip_code_id } }, as: :json
    assert_response 200
  end

  test "should destroy city_zip_code" do
    assert_difference('CityZipCode.count', -1) do
      delete city_zip_code_url(@city_zip_code), as: :json
    end

    assert_response 204
  end
end
