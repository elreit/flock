class CreateCompliments < ActiveRecord::Migration[6.0]
  def change
    create_table :compliments do |t|
      t.references :review, null: false, foreign_key: true
      t.string :content, null: false

      t.timestamps
    end
  end
end
