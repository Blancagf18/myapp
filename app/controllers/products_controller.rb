class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    Product.find(params[:id])
    @product = Product.find(params[:id])
  end
end
