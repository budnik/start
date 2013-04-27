class CreateIvalids < ActiveRecord::Migration
  def change
    create_table :ivalids do |t|
      t.string :name
      t.text :address

      t.timestamps
    end
  end
end
