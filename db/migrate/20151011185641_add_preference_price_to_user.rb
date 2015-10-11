class AddPreferencePriceToUser < ActiveRecord::Migration
  def change
    add_column :users, :price_preference, :integer
  end
end
