class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.integer :category_id
      t.float :price

      t.timestamps null: false
    end
  end
end
