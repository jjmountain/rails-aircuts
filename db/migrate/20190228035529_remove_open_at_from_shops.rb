class RemoveOpenAtFromShops < ActiveRecord::Migration[5.2]
  def change
    remove_column :shops, :open_at
    remove_column :shops, :close_at
    remove_column :shops, :logo
  end
end
