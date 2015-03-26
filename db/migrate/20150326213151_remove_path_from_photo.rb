class RemovePathFromPhoto < ActiveRecord::Migration
  def change
    remove_column :photos, :path, :string
  end
end
