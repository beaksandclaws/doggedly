class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :content
      t.integer :rating
      t.boolean :active
      t.references :user, index: true
      t.references :place, index: true

      t.timestamps null: false
    end
    add_foreign_key :reviews, :users
    add_foreign_key :reviews, :places
  end
end
