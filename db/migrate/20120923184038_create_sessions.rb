class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :volunteer_id
      t.integer :shop_id
      t.datetime :starts_at
      t.datetime :ends_at
      t.timestamps
    end
  end
end
