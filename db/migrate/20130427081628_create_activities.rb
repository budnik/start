class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :category
      t.date :deadline
      t.text :description
      t.string :state
      t.belongs_to :person
      t.belongs_to :volunteer

      t.timestamps
    end
    add_index :activities, :person_id
    add_index :activities, :volunteer_id
  end
end
