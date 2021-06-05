class AddDestinationToLocations < ActiveRecord::Migration[6.0]
  def change
    add_reference :locations, :destination
  end
end
