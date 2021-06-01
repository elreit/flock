class AddWalkAcceptedToWalks < ActiveRecord::Migration[6.0]
  def change
    add_column :walks, :walk_accepted, :boolean, default: false
  end
end
