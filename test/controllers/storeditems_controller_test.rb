require 'test_helper'

class StoreditemsControllerTest < ActionController::TestCase
  setup do
    @storeditem = storeditems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:storeditems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create storeditem" do
    assert_difference('Storeditem.count') do
      post :create, storeditem: { name: @storeditem.name, user_id: @storeditem.user_id }
    end

    assert_redirected_to storeditem_path(assigns(:storeditem))
  end

  test "should show storeditem" do
    get :show, id: @storeditem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @storeditem
    assert_response :success
  end

  test "should update storeditem" do
    patch :update, id: @storeditem, storeditem: { name: @storeditem.name, user_id: @storeditem.user_id }
    assert_redirected_to storeditem_path(assigns(:storeditem))
  end

  test "should destroy storeditem" do
    assert_difference('Storeditem.count', -1) do
      delete :destroy, id: @storeditem
    end

    assert_redirected_to storeditems_path
  end
end
