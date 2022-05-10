class AddUserRefToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :user, null: false, index: true
    add_foreign_key :likes, :users, column: :user_id, on_delete: :cascade
  end
end
