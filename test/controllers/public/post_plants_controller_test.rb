require "test_helper"

class Public::PostPlantsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_post_plants_new_url
    assert_response :success
  end

  test "should get index" do
    get public_post_plants_index_url
    assert_response :success
  end

  test "should get show" do
    get public_post_plants_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_post_plants_edit_url
    assert_response :success
  end
end
