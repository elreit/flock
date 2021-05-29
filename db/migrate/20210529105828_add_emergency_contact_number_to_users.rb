class AddEmergencyContactNumberToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :emergency_contact_number, :string
  end
end
