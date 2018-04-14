class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.string :title
      t.string :description
      t.boolean :complete
      t.date :due_date

      t.timestamps
    end
  end
end
