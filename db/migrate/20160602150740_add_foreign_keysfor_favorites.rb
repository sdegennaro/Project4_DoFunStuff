class AddForeignKeysforFavorites < ActiveRecord::Migration
  def change
    add_column :favorites, :event_id, :integer
    add_column :favorites, :user_id, :integer

    add_foreign_key :favorites, :events, on_delete: :cascade
    add_foreign_key :favorites, :users, on_delete: :cascade

  end
end
