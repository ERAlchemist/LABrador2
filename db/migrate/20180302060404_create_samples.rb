class CreateSamples < ActiveRecord::Migration[5.1]
  def change
    create_table :samples do |t|
      t.references :request, references: :samples
      t.string :tank
      t.string :lot_id
      t.timestamp :time_completed
      t.boolean :complete
      t.boolean :is_empty

      t.timestamps
    end
  end
end
