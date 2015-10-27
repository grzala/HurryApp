require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should login" do
    grant = users(:one)
    post :create, name: grant.name, password: 'passwordtest'
    assert_redirected_to login_url
    assert_equal grant.id, session[:user_id]
  end
  
  test "should fail login" do
    grant = users(:one)
    post :create, name: grant.name, password: 'fail'
    assert_redirected_to login_url
  end
  
  test "should logout" do
    delete :destroy
    assert_redirected_to root_url
  end

end
