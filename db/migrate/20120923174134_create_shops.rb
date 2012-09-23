class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :location

      t.timestamps
    end
  end
end
