class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :primary_product_id
      t.boolean :active, default: false, null: false
      t.integer :rank,   default: 100,   null: false, index: true
      t.string :name,                    null: false
      t.string :description,             null: false

      t.timestamps                       null: false
    end

    add_index :groups, [:active, :rank]
  end
end
