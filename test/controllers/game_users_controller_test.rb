require 'test_helper'

class GameUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get game_users_show_url
    assert_response :success
  end

  test "should get edit" do
    get game_users_edit_url
    assert_response :success
  end

  test "should get update" do
    get game_users_update_url
    assert_response :success
  end

end
