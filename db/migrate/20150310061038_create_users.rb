class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :name
      t.boolean :active
      t.integer :login_attempts
      t.string :password

      t.timestamps null: false
    end
  end
end
