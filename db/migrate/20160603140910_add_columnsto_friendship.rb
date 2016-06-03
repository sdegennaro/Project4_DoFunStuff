class AddColumnstoFriendship < ActiveRecord::Migration
  def change
    add_column :friendships, :friend_id, :integer
    add_column :friendships, :user_id, :integer

  end
end
