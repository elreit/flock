class CreateWalks < ActiveRecord::Migration[6.0]
  def change
    create_table :walks do |t|
      t.references :destination, null: false, foreign_key: true
      t.string :meeting_point
      t.string :walk_request_status
      t.integer :pin

      t.timestamps
    end
  end
end
