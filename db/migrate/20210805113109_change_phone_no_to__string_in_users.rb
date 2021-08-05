class ChangePhoneNoToStringInUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :phone_no, :string
  end
end
