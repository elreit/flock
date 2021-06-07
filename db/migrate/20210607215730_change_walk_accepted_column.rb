class ChangeWalkAcceptedColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :walks, :walk_accepted
    add_column :walks, :walk_request_status, :string
  end
end
