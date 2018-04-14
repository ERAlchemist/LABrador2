class CreateRecurrences < ActiveRecord::Migration[5.1]
  def change
    create_table :recurrences do |t|
      t.string :title
      t.string :description
      t.date :start_date

      t.timestamps
    end
  end
end
