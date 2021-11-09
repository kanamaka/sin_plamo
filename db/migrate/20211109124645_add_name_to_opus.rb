class AddNameToOpus < ActiveRecord::Migration[5.2]
  def change
    add_column :opus, :customer_id, :string
  end
end
