class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :shop_name
      t.string :owner_name
      t.string :address
      t.text :description
      t.integer :open_at
      t.integer :close_at
      t.string :photo
      t.string :url
      t.string :phone_number
      t.string :logo
      t.string :email
      t.string :password
      t.timestamps
    end
  end
end
