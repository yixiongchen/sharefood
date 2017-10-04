require 'test_helper'

class CanadianpostsControllerTest < ActionController::TestCase
  setup do
    @canadianpost = canadianposts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:canadianposts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create canadianpost" do
    assert_difference('Canadianpost.count') do
      post :create, canadianpost: { content: @canadianpost.content, foodtype: @canadianpost.foodtype, list_of_user_id: @canadianpost.list_of_user_id, location: @canadianpost.location, picture: @canadianpost.picture, status: @canadianpost.status, user_id: @canadianpost.user_id }
    end

    assert_redirected_to canadianpost_path(assigns(:canadianpost))
  end

  test "should show canadianpost" do
    get :show, id: @canadianpost
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @canadianpost
    assert_response :success
  end

  test "should update canadianpost" do
    patch :update, id: @canadianpost, canadianpost: { content: @canadianpost.content, foodtype: @canadianpost.foodtype, list_of_user_id: @canadianpost.list_of_user_id, location: @canadianpost.location, picture: @canadianpost.picture, status: @canadianpost.status, user_id: @canadianpost.user_id }
    assert_redirected_to canadianpost_path(assigns(:canadianpost))
  end

  test "should destroy canadianpost" do
    assert_difference('Canadianpost.count', -1) do
      delete :destroy, id: @canadianpost
    end

    assert_redirected_to canadianposts_path
  end
end
