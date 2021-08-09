class AddSearchfiltersToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :searchfilters, :string
  end
end
