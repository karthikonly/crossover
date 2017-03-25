require 'test_helper'

class SupportRequestsControllerTest < ActionController::TestCase
  setup do
    @support_request = support_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:support_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create support_request" do
    assert_difference('SupportRequest.count') do
      post :create, support_request: { creator_id: @support_request.creator_id, handler_id: @support_request.handler_id, product_id: @support_request.product_id, request_state_id: @support_request.request_state_id, title: @support_request.title }
    end

    assert_redirected_to support_request_path(assigns(:support_request))
  end

  test "should show support_request" do
    get :show, id: @support_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @support_request
    assert_response :success
  end

  test "should update support_request" do
    patch :update, id: @support_request, support_request: { creator_id: @support_request.creator_id, handler_id: @support_request.handler_id, product_id: @support_request.product_id, request_state_id: @support_request.request_state_id, title: @support_request.title }
    assert_redirected_to support_request_path(assigns(:support_request))
  end

  test "should destroy support_request" do
    assert_difference('SupportRequest.count', -1) do
      delete :destroy, id: @support_request
    end

    assert_redirected_to support_requests_path
  end
end
