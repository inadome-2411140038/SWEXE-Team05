require "test_helper"

class SpotsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get spots_url
    assert_response :success
  end

  test "should get show" do
    spot = spots(:one)
    get spot_url(spot)
    assert_response :success
  end
end