require 'test_helper'

class BartersControllerTest < ActionController::TestCase
  setup do
    @barter = barters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:barters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create barter" do
    assert_difference('Barter.count') do
      post :create, barter: { buyer: @barter.buyer, offer: @barter.offer, seller: @barter.seller, selling: @barter.selling }
    end

    assert_redirected_to barter_path(assigns(:barter))
  end

  test "should show barter" do
    get :show, id: @barter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @barter
    assert_response :success
  end

  test "should update barter" do
    patch :update, id: @barter, barter: { buyer: @barter.buyer, offer: @barter.offer, seller: @barter.seller, selling: @barter.selling }
    assert_redirected_to barter_path(assigns(:barter))
  end

  test "should destroy barter" do
    assert_difference('Barter.count', -1) do
      delete :destroy, id: @barter
    end

    assert_redirected_to barters_path
  end
end
