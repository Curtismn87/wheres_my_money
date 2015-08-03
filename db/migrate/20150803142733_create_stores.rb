class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.integer :total_spent
      t.datetime :created_at
    end
  end
end
