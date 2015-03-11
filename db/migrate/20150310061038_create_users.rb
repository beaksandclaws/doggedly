class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email, null: false, default: ""
      t.string :name
      t.boolean :active
      t.string :password

      t.timestamps null: false
    end
  end
end
