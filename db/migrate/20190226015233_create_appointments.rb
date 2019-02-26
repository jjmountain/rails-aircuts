class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.date :scheduled_at
      t.references :barber, foreign_key: true
      t.references :user, foreign_key: true
      t.string :state
      t.text :description
      t.string :photo

      t.timestamps
    end
  end
end
