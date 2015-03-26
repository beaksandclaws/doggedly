class RemoveWidthFromPhoto < ActiveRecord::Migration
  def change
    remove_column :photos, :width, :integer
  end
end
