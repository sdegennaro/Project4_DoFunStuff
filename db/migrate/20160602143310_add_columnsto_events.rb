class AddColumnstoEvents < ActiveRecord::Migration
  def change
    add_column :events, :date, :string
    add_column :events, :time, :string
    add_column :events, :title, :string
    add_column :events, :description, :string
    add_column :events, :location, :string
  end
end
