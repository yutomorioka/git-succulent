require "test_helper"

class Admin::PlantsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_plants_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_plants_edit_url
    assert_response :success
  end
end
