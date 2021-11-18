class AddImgToOpusImages < ActiveRecord::Migration[5.2]
  def change
    add_column :opus_images, :customer_id, :string
    add_column :opus_images, :opus_image_id, :string
  end
end
