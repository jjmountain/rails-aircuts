class ShopsController < ApplicationController
  after_action :verify_authorized, except: [:index, :show]

  def index
    @shops = policy_scope(Shop)
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
    @user = current_user

    @appointment = Appointment.new
  end
end
