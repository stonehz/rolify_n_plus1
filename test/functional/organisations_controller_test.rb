require 'test_helper'
include Devise::TestHelpers

class OrganisationsControllerTest < ActionController::TestCase
  setup do
    #@request.env["devise.mapping"] = Devise.mappings[:one]
    user = users(:one)
    @organisation = organisations(:one)
    sign_in user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:organisations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create organisation" do
    assert_difference('Organisation.count') do
      post :create, organisation: { name: @organisation.name }
    end

    assert_redirected_to organisation_path(assigns(:organisation))
  end

  test "should show organisation" do
    get :show, id: @organisation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @organisation
    assert_response :success
  end

  test "should update organisation" do
    put :update, id: @organisation, organisation: { name: @organisation.name }
    assert_redirected_to organisation_path(assigns(:organisation))
  end

  test "should destroy organisation" do
    assert_difference('Organisation.count', -1) do
      delete :destroy, id: @organisation
    end

    assert_redirected_to organisations_path
  end
end
