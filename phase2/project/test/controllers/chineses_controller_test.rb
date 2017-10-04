require 'test_helper'

class ChinesesControllerTest < ActionController::TestCase
  setup do
    @chinese = chineses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chineses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chinese" do
    assert_difference('Chinese.count') do
      post :create, chinese: { name: @chinese.name }
    end

    assert_redirected_to chinese_path(assigns(:chinese))
  end

  test "should show chinese" do
    get :show, id: @chinese
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chinese
    assert_response :success
  end

  test "should update chinese" do
    patch :update, id: @chinese, chinese: { name: @chinese.name }
    assert_redirected_to chinese_path(assigns(:chinese))
  end

  test "should destroy chinese" do
    assert_difference('Chinese.count', -1) do
      delete :destroy, id: @chinese
    end

    assert_redirected_to chineses_path
  end
end
