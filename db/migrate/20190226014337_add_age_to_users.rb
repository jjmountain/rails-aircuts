class AddAgeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :age, :integer
    add_column :users, :name, :string
    add_column :users, :gender, :string
    add_column :users, :address, :string
    add_column :users, :languages, :string
    add_column :users, :avatar, :string
  end
end
