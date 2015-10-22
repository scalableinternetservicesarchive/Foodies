require 'test_helper'

class ProfileControllerTest < ActionController::TestCase
  setup do
    @user = User.create!({
      :email => 'a@aa.com',
      :password => '11111111',
      :password_confirmation => '11111111'
    })
    sign_in @user
  end
  test "should get index" do
    get :index
    assert_response :success
  end
end
