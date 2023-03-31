require "test_helper"

class Admin::PostPlantControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_post_plant_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_post_plant_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_post_plant_edit_url
    assert_response :success
  end
end
