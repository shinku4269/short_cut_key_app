require 'test_helper'

class SckControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sck_index_url
    assert_response :success
  end

end
