class AddPhoneToPeople < ActiveRecord::Migration
  def change
    add_column :people, :phone, :integer
  end
end
