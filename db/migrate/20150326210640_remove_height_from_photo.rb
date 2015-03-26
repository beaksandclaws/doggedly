class RemoveHeightFromPhoto < ActiveRecord::Migration
  def change
    remove_column :photos, :height, :integer
  end
end
