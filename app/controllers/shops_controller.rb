class ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def show
    @shop = shop.find(params[:id])
  end
end
