require 'test_helper'

class JobPostingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job_posting = job_postings(:one)
  end

  test "should get index" do
    get job_postings_url, as: :json
    assert_response :success
  end

  test "should create job_posting" do
    assert_difference('JobPosting.count') do
      post job_postings_url, params: { job_posting: { contract_id: @job_posting.contract_id, description: @job_posting.description, job_category_id: @job_posting.job_category_id, title: @job_posting.title, user_profile_id: @job_posting.user_profile_id } }, as: :json
    end

    assert_response 201
  end

  test "should show job_posting" do
    get job_posting_url(@job_posting), as: :json
    assert_response :success
  end

  test "should update job_posting" do
    patch job_posting_url(@job_posting), params: { job_posting: { contract_id: @job_posting.contract_id, description: @job_posting.description, job_category_id: @job_posting.job_category_id, title: @job_posting.title, user_profile_id: @job_posting.user_profile_id } }, as: :json
    assert_response 200
  end

  test "should destroy job_posting" do
    assert_difference('JobPosting.count', -1) do
      delete job_posting_url(@job_posting), as: :json
    end

    assert_response 204
  end
end
