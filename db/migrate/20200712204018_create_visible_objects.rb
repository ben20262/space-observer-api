class CreateVisibleObjects < ActiveRecord::Migration[6.0]
  def change
    create_table :visible_objects do |t|
      t.string :name
      t.string :rise
      t.string :set
      t.string :magnitude

      t.timestamps
    end
  end
end
