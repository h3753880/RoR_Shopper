class ShopperController < ApplicationController
  include CurrentCart
  skip_before_action :authorize
  before_action :set_cart

  def index
    @products = Product.order(:name)

  end

  def search
    @products = Product.where("name LIKE ?", "%#{params[:name]}%")
        .where("description LIKE ?", "%#{params[:description]}%")
    if !params[:price1].empty? && !params[:price2].empty?
      @products = @products.where("price between ? and ?", "#{params[:price1]}", "#{params[:price2]}")
    end
    render "/shopper/index"
  end
end
