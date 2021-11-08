class Addition < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :opus_id, :integer
  end
end
