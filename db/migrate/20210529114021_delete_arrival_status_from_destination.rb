class DeleteArrivalStatusFromDestination < ActiveRecord::Migration[6.0]
  def change
    remove_column :destinations, :arrival_status, :string
  end
end
