class AddOpuIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :opu_id, :integer
  end
end
