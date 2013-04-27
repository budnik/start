class AddNameToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :name, :string
    remove_column :activities, :category
  end
end
