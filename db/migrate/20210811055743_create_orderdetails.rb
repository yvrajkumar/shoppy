class CreateOrderdetails < ActiveRecord::Migration[6.1]
  def change
    create_table :orderdetails do |t|
      t.integer :costsum
      t.string :email
      t.integer :tax
      t.string :deliverycharge
      t.string :integer
      t.integer :totalcost

      t.timestamps
    end
  end
end
