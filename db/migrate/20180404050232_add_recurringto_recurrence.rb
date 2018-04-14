class AddRecurringtoRecurrence < ActiveRecord::Migration[5.1]
  def change
    add_column :recurrences, :recurring, :text
     
  end
end
