class AddCustomerIdToCalendar < ActiveRecord::Migration[5.2]
  def change
    add_column :calendars, :customer_id, :integer
  end
end
