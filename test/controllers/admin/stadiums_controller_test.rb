require 'test_helper'

class Admin::StadiumsControllerTest < ActionController::TestCase
  setup do
    @stadium = stadiums(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stadiums)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stadium" do
    assert_difference('Stadium.count') do
      post :create, stadium: { address: @stadium.address, category_id: @stadium.category_id, description: @stadium.description, name: @stadium.name, telephone: @stadium.telephone }
    end

    assert_redirected_to admin_stadium_path(assigns(:stadium))
  end

  test "should show stadium" do
    get :show, id: @stadium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stadium
    assert_response :success
  end

  test "should update stadium" do
    patch :update, id: @stadium, stadium: { address: @stadium.address, category_id: @stadium.category_id, description: @stadium.description, name: @stadium.name, telephone: @stadium.telephone }
    assert_redirected_to admin_stadium_path(assigns(:stadium))
  end

  test "should destroy stadium" do
    assert_difference('Stadium.count', -1) do
      delete :destroy, id: @stadium
    end

    assert_redirected_to admin_stadiums_path
  end
end
