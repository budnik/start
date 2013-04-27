class AddLocationImageToVolunteers < ActiveRecord::Migration
  def change
    add_column :volunteers, :location, :string
    add_column :volunteers, :image, :string
  end
end
