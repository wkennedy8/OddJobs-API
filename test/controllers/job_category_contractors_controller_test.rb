require 'test_helper'

class JobCategoryContractorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job_category_contractor = job_category_contractors(:one)
  end

  test "should get index" do
    get job_category_contractors_url, as: :json
    assert_response :success
  end

  test "should create job_category_contractor" do
    assert_difference('JobCategoryContractor.count') do
      post job_category_contractors_url, params: { job_category_contractor: { contractor_id: @job_category_contractor.contractor_id, job_category_id: @job_category_contractor.job_category_id } }, as: :json
    end

    assert_response 201
  end

  test "should show job_category_contractor" do
    get job_category_contractor_url(@job_category_contractor), as: :json
    assert_response :success
  end

  test "should update job_category_contractor" do
    patch job_category_contractor_url(@job_category_contractor), params: { job_category_contractor: { contractor_id: @job_category_contractor.contractor_id, job_category_id: @job_category_contractor.job_category_id } }, as: :json
    assert_response 200
  end

  test "should destroy job_category_contractor" do
    assert_difference('JobCategoryContractor.count', -1) do
      delete job_category_contractor_url(@job_category_contractor), as: :json
    end

    assert_response 204
  end
end
