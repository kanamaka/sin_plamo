class ChangeColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :opus_images, :opus_id, :opu_id
  end
end
