class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :picture
      t.string :location
      t.text :description
      t.string :title
      t.float :price
      t.datetime :expiration_date
      t.string :condition

      t.timestamps null: false
    end
  end
end
