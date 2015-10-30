require 'test_helper'

class MasterpiecesControllerTest < ActionController::TestCase
  setup do
    @masterpiece = masterpieces(:masterpiece1)
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
    assert_not_nil assigns(:masterpieces)
  end

  test "should get new" do
    # get :new
    # assert_response :success
  end

  test "should create masterpiece" do
    assert_difference('Masterpiece.count') do
      post :create, masterpiece: { description: @masterpiece.description, recipe_id: @masterpiece.recipe_id, user_id: @masterpiece.user_id }
    end

    assert_redirected_to masterpiece_path(assigns(:masterpiece))
  end

  test "should show masterpiece" do
    get :show, id: @masterpiece
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @masterpiece
    assert_response :success
  end

  test "should update masterpiece" do
    patch :update, id: @masterpiece, masterpiece: { description: @masterpiece.description, recipe_id: @masterpiece.recipe_id, user_id: @masterpiece.user_id }
    assert_redirected_to masterpiece_path(assigns(:masterpiece))
  end

  test "should destroy masterpiece" do
    assert_difference('Masterpiece.count', -1) do
      delete :destroy, id: @masterpiece
    end

    assert_redirected_to masterpieces_path
  end
end
