class ChangeScheduledAtToBeDatetimeInAppointments < ActiveRecord::Migration[5.2]
  def change
    change_column :appointments, :scheduled_at, :datetime
  end
end
