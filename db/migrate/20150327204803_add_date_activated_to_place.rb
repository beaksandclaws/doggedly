class AddDateActivatedToPlace < ActiveRecord::Migration
  def change
    add_column :places, :date_activated, :datetime
  end
end
