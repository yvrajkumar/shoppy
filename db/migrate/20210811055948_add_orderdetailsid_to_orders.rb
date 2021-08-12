class AddOrderdetailsidToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :orderdetailsid, :integer
  end
end
