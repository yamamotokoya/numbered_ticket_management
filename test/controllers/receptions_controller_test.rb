require 'test_helper'

class ReceptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get receptions_new_url
    assert_response :success
  end

  test "should get create" do
    get receptions_create_url
    assert_response :success
  end

end
