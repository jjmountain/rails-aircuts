class IncomingAppointmentsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_shop!
  skip_after_action :verify_policy_scoped

  def index
    @appointments = current_shop.appointments.order(scheduled_at: :asc)
  end

  def update
    if %w{ Accepted Denied }.include?(params[:appointment][:state])
      @appointment = current_shop.appointments.find(params[:id])
      @appointment.state = params[:appointment][:state]
      authorize @appointment
      @appointment.save!
    end

    redirect_to incoming_appointments_path
  end

  private

  def destroy
  end
end
