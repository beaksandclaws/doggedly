class RemoveActiveFromPlace < ActiveRecord::Migration
  def change
    remove_column :places, :active, :boolean
  end
end
