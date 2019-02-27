class AppointmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.appointments
    end
  end

  def index?
    true
  end

  def create?
    true
  end
end
