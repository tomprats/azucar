class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :group_id,               null: false, index: true
      t.boolean :active, default: false, null: false
      t.integer :rank,   default: 100,   null: false, index: true
      t.string :name,                    null: false
      t.integer :price,  default: 0,     null: false
      t.string :description,             null: false
      t.string :image,                   null: false

      t.timestamps                       null: false
    end

    add_index :products, [:group_id, :active, :rank]
  end
end
