require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get only:index" do
    get home_only:index_url
    assert_response :success
  end
end
