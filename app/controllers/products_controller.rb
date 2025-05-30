class ProductsController < ApplicationController
  def index
    @products = Product.all.with_attached_image
  end

  def show
    product
  end

  def new
    @product = Product.new
  end

  def create
      @product = Product.new(product_params)

      if @product.save
                redirect_to products_path, notice => "El producto fue creado correctamente"
      else
                render :new, status: :unprocessable_entity
      end
  end

def edit
  product
end

def update
  if product.update(product_params)
    redirect_to products_path, notice: "El producto fue actualizado correctamente"
  else
    render :edit, status: :unprocessable_entity
  end
end

def destroy
  product.destroy

  redirect_to products_path, notice: "El producto fue eliminado correctamente", status: :see_other
end


  private
  def product_params
        params.require(:product).permit(:title, :description, :price, :image)
  end


  def product
    @product = Product.find(params[:id])
  end
end
