class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :path
      t.boolean :active
      t.string :imageable_type
      t.integer :imageable_id
      t.references :user, index: true
      t.integer :width
      t.integer :height

      t.timestamps null: false
    end
    add_foreign_key :photos, :users
  end
end
