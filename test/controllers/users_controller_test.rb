#By Grant Christie

require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @input_attributes = {
      :name => "grant",
      :email => "grant@test.com",
      :password => "password",
      :password_confirmation => "password",
      :admin => "false"
    }
    
    @user = users(:one)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, :user => @input_attributes
    end
    assert_redirected_to login_url
  end

end
