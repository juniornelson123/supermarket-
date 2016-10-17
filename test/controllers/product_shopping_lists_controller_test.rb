require 'test_helper'

class ProductShoppingListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_shopping_list = product_shopping_lists(:one)
  end

  test "should get index" do
    get product_shopping_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_product_shopping_list_url
    assert_response :success
  end

  test "should create product_shopping_list" do
    assert_difference('ProductShoppingList.count') do
      post product_shopping_lists_url, params: { product_shopping_list: {  } }
    end

    assert_redirected_to product_shopping_list_url(ProductShoppingList.last)
  end

  test "should show product_shopping_list" do
    get product_shopping_list_url(@product_shopping_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_shopping_list_url(@product_shopping_list)
    assert_response :success
  end

  test "should update product_shopping_list" do
    patch product_shopping_list_url(@product_shopping_list), params: { product_shopping_list: {  } }
    assert_redirected_to product_shopping_list_url(@product_shopping_list)
  end

  test "should destroy product_shopping_list" do
    assert_difference('ProductShoppingList.count', -1) do
      delete product_shopping_list_url(@product_shopping_list)
    end

    assert_redirected_to product_shopping_lists_url
  end
end
