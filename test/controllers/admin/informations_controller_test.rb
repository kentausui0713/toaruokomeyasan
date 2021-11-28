require 'test_helper'

class Admin::InformationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_informations_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_informations_show_url
    assert_response :success
  end

end
