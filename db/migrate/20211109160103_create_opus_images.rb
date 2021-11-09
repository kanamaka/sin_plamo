class CreateOpusImages < ActiveRecord::Migration[5.2]
  def change
    create_table :opus_images do |t|
      t.integer :opus_id
      t.string :image_id

      t.timestamps
    end
  end
end
