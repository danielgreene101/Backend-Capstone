class AddSeriesIdToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :characters, :series_id, :integer
  end
end
