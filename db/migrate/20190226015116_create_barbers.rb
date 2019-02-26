class CreateBarbers < ActiveRecord::Migration[5.2]
  def change
    create_table :barbers do |t|
      t.string :name
      t.references :shop, foreign_key: true
      t.integer :age
      t.text :description
      t.string :gender
      t.string :languages
      t.string :avatar

      t.timestamps
    end
  end
end
