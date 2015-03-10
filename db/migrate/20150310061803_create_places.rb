class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.boolean :active
      t.references :city, index: true
      t.boolean :alcohol
      t.text :location_info
      t.text :hours
      t.text :how_enter
      t.boolean :food
      t.boolean :waterbowl
      t.text :useful_tips

      t.timestamps null: false
    end
    add_foreign_key :places, :cities
  end
end
