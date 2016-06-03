class AddForeignKeytoFriendships < ActiveRecord::Migration
  def change
    add_foreign_key :friendships, :users, on_delete: :cascade

  end
end
