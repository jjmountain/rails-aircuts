class ShopsController < ApplicationController
    skip_before_action :authenticate_user!, only: :index

  def index
    @shops = Shop.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end
end
