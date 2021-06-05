class RemoveColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :destinations, :start_point
    remove_column :destinations, :end_point
    remove_column :destinations, :start_latitude
    remove_column :destinations, :start_longitude
    remove_column :destinations, :end_latitude
    remove_column :destinations, :end_longitude
    remove_column :locations, :destination_id
  end
end

