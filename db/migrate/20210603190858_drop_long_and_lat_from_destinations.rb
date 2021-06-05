class DropLongAndLatFromDestinations < ActiveRecord::Migration[6.0]
  def change
    remove_column :destinations, :longitude
    remove_column :destinations, :latitude
  end
end
