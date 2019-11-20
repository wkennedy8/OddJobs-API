require 'test_helper'

class ZipCodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @zip_code = zip_codes(:one)
  end

  test "should get index" do
    get zip_codes_url, as: :json
    assert_response :success
  end

  test "should create zip_code" do
    assert_difference('ZipCode.count') do
      post zip_codes_url, params: { zip_code: { value: @zip_code.value } }, as: :json
    end

    assert_response 201
  end

  test "should show zip_code" do
    get zip_code_url(@zip_code), as: :json
    assert_response :success
  end

  test "should update zip_code" do
    patch zip_code_url(@zip_code), params: { zip_code: { value: @zip_code.value } }, as: :json
    assert_response 200
  end

  test "should destroy zip_code" do
    assert_difference('ZipCode.count', -1) do
      delete zip_code_url(@zip_code), as: :json
    end

    assert_response 204
  end
end
