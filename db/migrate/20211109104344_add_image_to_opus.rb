class AddImageToOpus < ActiveRecord::Migration[5.2]
  def change
    add_column :opus, :image_id, :string
  end
end
