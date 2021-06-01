class AddArrivedToDestinations < ActiveRecord::Migration[6.0]
  def change
    add_column :destinations, :arrived, :boolean, default: false
  end
end
