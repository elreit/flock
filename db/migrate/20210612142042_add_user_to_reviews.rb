class AddUserToReviews < ActiveRecord::Migration[6.0]
  def change
    remove_column :reviews, :reviewee_id
    remove_column :reviews, :user_id
    add_reference :reviews, :reviewee
    add_reference :reviews, :user
  end
end
