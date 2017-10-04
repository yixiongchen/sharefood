require 'test_helper'

class MexicansControllerTest < ActionController::TestCase
  setup do
    @mexican = mexicans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mexicans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mexican" do
    assert_difference('Mexican.count') do
      post :create, mexican: {  }
    end

    assert_redirected_to mexican_path(assigns(:mexican))
  end

  test "should show mexican" do
    get :show, id: @mexican
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mexican
    assert_response :success
  end

  test "should update mexican" do
    patch :update, id: @mexican, mexican: {  }
    assert_redirected_to mexican_path(assigns(:mexican))
  end

  test "should destroy mexican" do
    assert_difference('Mexican.count', -1) do
      delete :destroy, id: @mexican
    end

    assert_redirected_to mexicans_path
  end
end
