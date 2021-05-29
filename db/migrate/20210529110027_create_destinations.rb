class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.references :user, null: false, foreign_key: true
      t.string :start_point
      t.string :end_point
      t.string :arrival_status

      t.timestamps
    end
  end
end
