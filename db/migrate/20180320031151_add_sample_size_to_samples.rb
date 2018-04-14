class AddSampleSizeToSamples < ActiveRecord::Migration[5.1]
  def change
    add_column :samples, :sample_size, :string
  end
end
