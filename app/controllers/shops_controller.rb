class ShopsController < ApplicationController
  after_action :verify_authorized, except: [:index, :show]

  def index
    @shops = Shop.all
    @shops = policy_scope(Shop)
  end

  def show
    @shop = Shop.find(params[:id])
    @user = current_user

    @appointment = Appointment.new
  end
end
