class AddImageToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :opus, :image, :string
    add_column :opus, :name, :string
    add_column :opus, :profile, :string
  end
end
