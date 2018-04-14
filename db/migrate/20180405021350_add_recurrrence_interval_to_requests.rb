class AddRecurrrenceIntervalToRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :requests, :recurrence_interval, :integer
  end
end
