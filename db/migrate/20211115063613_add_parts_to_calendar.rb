class AddPartsToCalendar < ActiveRecord::Migration[5.2]
  def change
    add_column :calendars, :parts, :string
  end
end
