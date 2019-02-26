class AddShopnameToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :shop_name, :string
    add_column :shops, :owner_name, :string
    add_column :shops, :description, :string
    add_column :shops, :address, :string
    add_column :shops, :open_at, :integer
    add_column :shops, :close_at, :integer
    add_column :shops, :photo, :string
    add_column :shops, :url, :string
    add_column :shops, :phone_number, :string
    add_column :shops, :logo, :string
  end
end
