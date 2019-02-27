class AddStateToAppointments < ActiveRecord::Migration[5.2]
  def change
    change_column_default :appointments, :state, "Pending"
  end
end
