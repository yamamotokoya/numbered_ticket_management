require 'test_helper'

class ReceptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get receptions_create_url
    assert_response :success
  end

end
