require "test_helper"

class ProductsControllerTests < ActionDispatch::IntegrationTest
  test "render a list of products" do
    get products_path

    assert_response :success
    assert_select ".product", 2
  end
  test "render a detailed product page" do
    get product_path(products(:ps4))

    assert_response :success
    assert_select ".title", "PS4"
    assert_select ".description", "PS4 en buen estado"
    assert_select ".price", "150$"
  end

test "render a new product form" do
    get new_product_path

    assert_response :success
    assert_select "form"
  end

test "allow to create a new product" do
    post products_path, params: { product: { title: "PS4", description: "PS4 en buen estado", price: 150 } }

    assert_redirected_to products_path
    assert_equal flash[:notice], "El producto fue creado correctamente"
  end

  test "does not allow to create a new product with empty fields" do
    post products_path, params: { product: { title: "", description: "PS4 en buen estado", price: 150 } }

    assert_response :unprocessable_entity
  end

  test "render a edit product form" do
    get edit_product_path(products(:ps4))

    assert_response :success
    assert_select "form"
  end

  test "allow to update a product" do
    patch product_path(products(:ps4)), params: { product: { title: "PS4", description: "PS4 en buen estado", price: 165 } }

    assert_redirected_to products_path
    assert_equal flash[:notice], "El producto fue actualizado correctamente"
  end
end
