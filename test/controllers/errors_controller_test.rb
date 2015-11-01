require 'test_helper'

class ErrorsControllerTest < ActionController::TestCase
  test "should get not_found" do
    get :not_found
    assert_response 404
  end

  test "should get unacceptable" do
    get :unacceptable
    assert_response 422
  end

  test "should get internal_server_error" do
    get :internal_server_error
    assert_response 500
  end

  test "should get security_transgression_error" do
    get :security_transgression_error
    assert_response :success
  end

end
