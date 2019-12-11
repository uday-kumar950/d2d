require 'test_helper'

class VehiclesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get vehicles_new_url
    assert_response :success
  end

  test "should get locations" do
    get vehicles_locations_url
    assert_response :success
  end

end
