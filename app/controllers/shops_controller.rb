class ShopsController < ApplicationController

  def index
    @shops = policy_scope(Shop)
  end

  def show
    @shop = shop.find(params[:id])
  end
end
