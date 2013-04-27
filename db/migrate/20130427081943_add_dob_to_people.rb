class AddDobToPeople < ActiveRecord::Migration
  def change
    add_column :people, :dob, :date
  end
end
