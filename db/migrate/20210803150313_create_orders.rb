class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :order_id
      t.integer :product_id
      t.string :email
      t.integer :quantity
      t.string :status
      t.integer :cost

      t.timestamps
    end
  end
end
