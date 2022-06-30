require "test_helper"

class BooktoursControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get booktours_create_url
    assert_response :success
  end

  test "should get destroy" do
    get booktours_destroy_url
    assert_response :success
  end
end
