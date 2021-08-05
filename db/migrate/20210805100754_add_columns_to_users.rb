class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :door_no, :string
    add_column :users, :street, :string
    add_column :users, :area, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :country, :string 
    add_column :users, :phone_no, :integer
  end
end
