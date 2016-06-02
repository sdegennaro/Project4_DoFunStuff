class AddUrlColumnstoEvents < ActiveRecord::Migration
  def change
    add_column :events, :url, :string
    add_column :events, :image_url, :string
  end
end
