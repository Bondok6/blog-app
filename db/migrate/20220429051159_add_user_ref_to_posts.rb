class AddUserRefToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :user, null: false, index: true
    add_foreign_key :posts, :users, column: :author_id, on_delete: :cascade
  end
end
