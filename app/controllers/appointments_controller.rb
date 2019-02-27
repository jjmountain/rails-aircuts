class AppointmentsController < ApplicationController

  def index
    @appointments = policy_scope(Appointment)
  end

  def show


  end

  def create
    # we need to somehow add a barber and user to this appointment
    # we think user can be current_user from devise
    # we think barber can be sampled
    # the question is, how do we put these into the form so that when it submits an appointment a valid appointment is created
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user
    authorize @appointment
    if @appointment.save
      redirect_to appointments_path(@user)
    else
      render :show
    end
  end

  def destroy
  end

  def update
  end

  private

  def appointment_params
    params.require(:appointment).permit(:description, :photo, :scheduled_at, :barber_id)
  end
end
