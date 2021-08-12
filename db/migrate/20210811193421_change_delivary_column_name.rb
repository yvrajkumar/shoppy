class ChangeDelivaryColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :orderdetails, :delivarycharge, :deliverycharge
  end
end
