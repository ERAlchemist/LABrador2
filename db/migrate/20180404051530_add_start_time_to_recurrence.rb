class AddStartTimeToRecurrence < ActiveRecord::Migration[5.1]
  def change
    add_column :recurrences, :start_time, :datetime
  end
end
