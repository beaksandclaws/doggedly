class AddHasWifiToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :has_wifi, :boolean
  end
end
