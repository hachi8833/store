require "test_helper"

class WishlistsTest < ActionDispatch::IntegrationTest
  test "create a wishlist" do
    user = users(:one)
    sign_in_as user
    assert_difference "user.wishlists.count" do
      post wishlists_path, params: { wishlist: { name: "Example" } }
      assert_response :redirect
    end
  end

  test "delete a wishlist" do
    user = users(:one)
    sign_in_as user
    assert_difference "user.wishlists.count", -1 do
      delete wishlist_path(user.wishlists.first)
      assert_redirected_to wishlists_path
    end
  end

  test "view a wishlist" do
    user = users(:one)
    wishlist = user.wishlists.first
    sign_in_as user
    get wishlist_path(wishlist)
    assert_response :success
    assert_select "h1", text: wishlist.name
  end

  test "view a wishlist as another user" do
    wishlist = wishlists(:two)
    sign_in_as users(:one)
    get wishlist_path(wishlist)
    assert_response :success
    assert_select "h1", text: wishlist.name
  end

  test "view a wishlist as a guest" do
    wishlist = wishlists(:one)
    get wishlist_path(wishlist)
    assert_response :success
    assert_select "h1", text: wishlist.name
  end
end
