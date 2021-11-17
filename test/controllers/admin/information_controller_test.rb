require 'test_helper'

class Admin::InformationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_information_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_information_show_url
    assert_response :success
  end

end
