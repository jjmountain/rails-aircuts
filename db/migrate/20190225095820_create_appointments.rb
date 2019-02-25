class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.date :scheduled_at
      t.string :state
      t.string :description
      t.string :photo
      t.references :barber, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
