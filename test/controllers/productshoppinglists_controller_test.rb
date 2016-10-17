require 'test_helper'

class ProductshoppinglistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @productshoppinglist = productshoppinglists(:one)
  end

  test "should get index" do
    get productshoppinglists_url
    assert_response :success
  end

  test "should get new" do
    get new_productshoppinglist_url
    assert_response :success
  end

  test "should create productshoppinglist" do
    assert_difference('Productshoppinglist.count') do
      post productshoppinglists_url, params: { productshoppinglist: {  } }
    end

    assert_redirected_to productshoppinglist_url(Productshoppinglist.last)
  end

  test "should show productshoppinglist" do
    get productshoppinglist_url(@productshoppinglist)
    assert_response :success
  end

  test "should get edit" do
    get edit_productshoppinglist_url(@productshoppinglist)
    assert_response :success
  end

  test "should update productshoppinglist" do
    patch productshoppinglist_url(@productshoppinglist), params: { productshoppinglist: {  } }
    assert_redirected_to productshoppinglist_url(@productshoppinglist)
  end

  test "should destroy productshoppinglist" do
    assert_difference('Productshoppinglist.count', -1) do
      delete productshoppinglist_url(@productshoppinglist)
    end

    assert_redirected_to productshoppinglists_url
  end
end
