class BarberPolicy < ApplicationPolicy

  def update?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

end

 # def create
 #    barber = Barber.new(params)
 #    barber.shop = current_user
 #  end
