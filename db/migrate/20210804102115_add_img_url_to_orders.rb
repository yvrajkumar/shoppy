class AddImgUrlToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :img_url, :string
  end
end
