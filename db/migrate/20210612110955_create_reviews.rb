class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.bigint :user_id
      t.bigint :reviewee_id
      t.float :rating
      t.string :content

      t.timestamps
    end
  end
end
