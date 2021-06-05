class AddLocationsToDestinations < ActiveRecord::Migration[6.0]
  def change
    add_column :destinations, :start_location_id, :bigint
    add_column :destinations, :end_location_id, :bigint
  end
end
