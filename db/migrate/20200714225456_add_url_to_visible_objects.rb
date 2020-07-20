class AddUrlToVisibleObjects < ActiveRecord::Migration[6.0]
  def change
    add_column :visible_objects, :url, :string
  end
end
