class RemovePhoneNumberFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :phone_number, :integer
  end
end
