class AddLatitudeToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :latitude, :float
    add_column :shops, :longitude, :float
    add_column :shops, :rating, :string
    add_column :shops, :price, :string
    add_column :shops, :yelp_id, :string
  end
end
