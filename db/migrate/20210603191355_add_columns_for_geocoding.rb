class AddColumnsForGeocoding < ActiveRecord::Migration[6.0]
  def change
    add_column :destinations, :start_latitude, :float
    add_column :destinations, :start_longitude, :float
    add_column :destinations, :end_latitude, :float
    add_column :destinations, :end_longitude, :float
  end
end
