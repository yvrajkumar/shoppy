class AddTitleToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :title, :string
  end
end
