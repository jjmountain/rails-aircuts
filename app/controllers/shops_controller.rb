class ShopsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @shops = policy_scope(Shop)
  end

  def show
    @shop = Shop.find(params[:id])
    authorize @shop
    @user = current_user
    @appointment = Appointment.new
  end
end
