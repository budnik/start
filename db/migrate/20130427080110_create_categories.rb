class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.date :deadline
      t.text :description
      t.string :state
      t.belongs_to :invalid
      t.belongs_to :volunteer

      t.timestamps
    end
    add_index :categories, :invalid_id
    add_index :categories, :volunteer_id
  end
end
