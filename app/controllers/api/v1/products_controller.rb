class Api::V1::ProductsController < ApplicationController
  def create 
    Product.create(product_params)
  end

  private

  def product_params 
    params.require(:product).permit(:name, :description, :price)
  end
end 
