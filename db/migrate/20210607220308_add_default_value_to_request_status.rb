class AddDefaultValueToRequestStatus < ActiveRecord::Migration[6.0]
  def change
    change_column :walks, :walk_request_status, :string, default: "Pending"
  end
end
