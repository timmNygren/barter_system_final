require 'test_helper'

class SwapsControllerTest < ActionController::TestCase
  setup do
    @swap = swaps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:swaps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create swap" do
    assert_difference('Swap.count') do
      post :create, swap: { aution_id: @swap.aution_id, offer_id: @swap.offer_id, state: @swap.state }
    end

    assert_redirected_to swap_path(assigns(:swap))
  end

  test "should show swap" do
    get :show, id: @swap
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @swap
    assert_response :success
  end

  test "should update swap" do
    patch :update, id: @swap, swap: { aution_id: @swap.aution_id, offer_id: @swap.offer_id, state: @swap.state }
    assert_redirected_to swap_path(assigns(:swap))
  end

  test "should destroy swap" do
    assert_difference('Swap.count', -1) do
      delete :destroy, id: @swap
    end

    assert_redirected_to swaps_path
  end
end
