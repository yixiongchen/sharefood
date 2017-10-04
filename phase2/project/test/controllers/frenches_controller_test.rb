require 'test_helper'

class FrenchesControllerTest < ActionController::TestCase
  setup do
    @french = frenches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:frenches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create french" do
    assert_difference('French.count') do
      post :create, french: {  }
    end

    assert_redirected_to french_path(assigns(:french))
  end

  test "should show french" do
    get :show, id: @french
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @french
    assert_response :success
  end

  test "should update french" do
    patch :update, id: @french, french: {  }
    assert_redirected_to french_path(assigns(:french))
  end

  test "should destroy french" do
    assert_difference('French.count', -1) do
      delete :destroy, id: @french
    end

    assert_redirected_to frenches_path
  end
end
