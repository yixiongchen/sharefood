require 'test_helper'

class VegetariansControllerTest < ActionController::TestCase
  setup do
    @vegetarian = vegetarians(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vegetarians)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vegetarian" do
    assert_difference('Vegetarian.count') do
      post :create, vegetarian: {  }
    end

    assert_redirected_to vegetarian_path(assigns(:vegetarian))
  end

  test "should show vegetarian" do
    get :show, id: @vegetarian
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vegetarian
    assert_response :success
  end

  test "should update vegetarian" do
    patch :update, id: @vegetarian, vegetarian: {  }
    assert_redirected_to vegetarian_path(assigns(:vegetarian))
  end

  test "should destroy vegetarian" do
    assert_difference('Vegetarian.count', -1) do
      delete :destroy, id: @vegetarian
    end

    assert_redirected_to vegetarians_path
  end
end
