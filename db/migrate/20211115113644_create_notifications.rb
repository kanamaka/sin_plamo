class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
    t.integer :customer_id, null: false
    t.integer :customer_id, null: false
    t.integer :opu_id
    t.integer :comment_id
    t.string :favorites, default: '', null: false
    t.boolean :checked, default: false, null: false
    t.timestamps
    end
    
  end
end
