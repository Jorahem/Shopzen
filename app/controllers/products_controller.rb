class ProductsController < ApplicationController
  def index
    @products = Product.limit(24)
  end

  def show
    @product = Product.find_by!(slug: params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to products_path, alert: 'Product not found'
  end
end
