class CreateSmallTelescopeObjects < ActiveRecord::Migration[6.0]
  def change
    create_table :small_telescope_objects do |t|
      t.string :name
      t.string :rise
      t.string :set
      t.string :magnitude
      t.string :url

      t.timestamps
    end
  end
end
