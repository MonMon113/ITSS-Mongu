class ProductsController < ApplicationController
  def index
    set_categories_data
    set_products_data
  end
  
  def show
    @product = Product.includes(:product_feature, :category).find(params[:id])
    @male_product_colors = @product.product_feature.where(gender: 0).uniq{|x| x.color}.pluck(:color)
    @male_product_colors = @product.product_feature.where(gender: 0).uniq{|x| x.color}.pluck(:color)
  end
  
  private
  
  def set_categories_data
    @categories = Category.all
  end
  
  def set_products_data
    @products = Product.all
    @latest_products = Product.includes(:product_feature).order(created_at: :desc)
  end
end
