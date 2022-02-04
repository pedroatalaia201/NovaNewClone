require 'test_helper'

class AnnounceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get announce_index_url
    assert_response :success
  end

end
