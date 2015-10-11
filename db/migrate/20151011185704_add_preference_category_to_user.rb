class AddPreferenceCategoryToUser < ActiveRecord::Migration
  def change
    add_column :users, :category_preference, :integer
  end
end
