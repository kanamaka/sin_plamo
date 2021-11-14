class AddIndexToFavoritesAddIndexCustomerIdOpuId < ActiveRecord::Migration[5.2]
  def change
    add_index :favorites, [:customer_id, :opu_id], unique: true
  end
end
