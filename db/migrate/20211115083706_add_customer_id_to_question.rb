class AddCustomerIdToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :customer_id, :integer
  end
end
