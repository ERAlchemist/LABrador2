class AddIsRecurringToRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :requests, :is_recurring, :boolean
  end
end
