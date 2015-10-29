#By Grant Christie

require 'test_helper'

class ToiletsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:toilets)
  end
  
  test "should map toilets" do
    get :map
    assert_response :success
    assert_not_nil assigns(:toilets)
  end
end
