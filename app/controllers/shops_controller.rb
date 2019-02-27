class ShopsController < ApplicationController

  def index
<<<<<<< HEAD
    @shops = Shop.all
=======
    @shops = policy_scope(Shop)
>>>>>>> 926e69135802b62ef32e3809aefb81f7ca3309ea
  end

  def show
    @shop = shop.find(params[:id])
  end
end
