class AddStartedToDestinations < ActiveRecord::Migration[6.0]
  def change
    add_column :destinations, :started, :boolean, default: false
  end
end
