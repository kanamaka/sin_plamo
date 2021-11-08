class Customers < ActiveRecord::Migration[5.2]
  def up
   add_column :customers, :profile_image_id, :string
   add_column :customers, :profile, :string
  end
end
