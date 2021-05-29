class AddDestinationsToWalks < ActiveRecord::Migration[6.0]
  def change
    add_reference :walks, :user_destination
    add_reference :walks, :buddy_destination
  end
end
