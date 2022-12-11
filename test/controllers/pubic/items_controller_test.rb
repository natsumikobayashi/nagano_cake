require "test_helper"

class Pubic::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pubic_items_index_url
    assert_response :success
  end

  test "should get show" do
    get pubic_items_show_url
    assert_response :success
  end
end
