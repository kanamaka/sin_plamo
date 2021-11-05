class CreateOpus < ActiveRecord::Migration[5.2]
  def change
    create_table :opus do |t|
      t.integer :tag
      t.string :opus_name
      t.text :opus_explanation
      t.string :opus_image_id

      t.timestamps
    end
  end
end
