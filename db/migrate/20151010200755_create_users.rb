class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :facebook_id
      t.string :password
      t.boolean :undergraduate

      t.timestamps null: false
    end
  end
end
