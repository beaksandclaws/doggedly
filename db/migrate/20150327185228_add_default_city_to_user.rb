class AddDefaultCityToUser < ActiveRecord::Migration
  def change
    add_column :users, :default_city_id, :integer
  end
end
