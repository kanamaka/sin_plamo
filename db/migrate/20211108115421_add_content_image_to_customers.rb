class AddContentImageToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :content_image_id, :string
  end
end
