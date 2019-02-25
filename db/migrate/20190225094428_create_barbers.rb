class CreateBarbers < ActiveRecord::Migration[5.2]
  def change
    create_table :barbers do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.string :languages
      t.string :avatar
      t.string :description
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
