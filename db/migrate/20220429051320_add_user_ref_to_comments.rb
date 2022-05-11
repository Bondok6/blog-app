class AddUserRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :user, null: false, index: true
    add_foreign_key :comments, :users, column: :user_id, on_delete: :cascade
  end
end
