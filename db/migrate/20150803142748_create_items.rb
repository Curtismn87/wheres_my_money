class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :amount
      t.datetime :created_at
      t.references :store, index: true, foreign_key: true
    end
  end
end
