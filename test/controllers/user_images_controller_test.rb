require 'test_helper'

class UserImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_image = user_images(:one)
  end

  test "should get index" do
    get user_images_url, as: :json
    assert_response :success
  end

  test "should create user_image" do
    assert_difference('UserImage.count') do
      post user_images_url, params: { user_image: { url: @user_image.url, user_profile_id: @user_image.user_profile_id } }, as: :json
    end

    assert_response 201
  end

  test "should show user_image" do
    get user_image_url(@user_image), as: :json
    assert_response :success
  end

  test "should update user_image" do
    patch user_image_url(@user_image), params: { user_image: { url: @user_image.url, user_profile_id: @user_image.user_profile_id } }, as: :json
    assert_response 200
  end

  test "should destroy user_image" do
    assert_difference('UserImage.count', -1) do
      delete user_image_url(@user_image), as: :json
    end

    assert_response 204
  end
end
