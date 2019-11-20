require 'test_helper'

class ContractorImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contractor_image = contractor_images(:one)
  end

  test "should get index" do
    get contractor_images_url, as: :json
    assert_response :success
  end

  test "should create contractor_image" do
    assert_difference('ContractorImage.count') do
      post contractor_images_url, params: { contractor_image: { contractor_id: @contractor_image.contractor_id, url: @contractor_image.url } }, as: :json
    end

    assert_response 201
  end

  test "should show contractor_image" do
    get contractor_image_url(@contractor_image), as: :json
    assert_response :success
  end

  test "should update contractor_image" do
    patch contractor_image_url(@contractor_image), params: { contractor_image: { contractor_id: @contractor_image.contractor_id, url: @contractor_image.url } }, as: :json
    assert_response 200
  end

  test "should destroy contractor_image" do
    assert_difference('ContractorImage.count', -1) do
      delete contractor_image_url(@contractor_image), as: :json
    end

    assert_response 204
  end
end
