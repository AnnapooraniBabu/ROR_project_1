require "test_helper"

class MomsDelishesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get moms_delishes_index_url
    assert_response :success
  end
end
