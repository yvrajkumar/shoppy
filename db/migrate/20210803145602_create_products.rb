class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title
      t.integer :age
      t.string :brand
      t.string :category
      t.string :cloth_type
      t.string :color
      t.string :gender
      t.integer :product_id
      t.string :img_url
      t.integer :price
      t.integer :size

      t.timestamps
    end
  end
end
