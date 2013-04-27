class DeviseCreateVolunteers < ActiveRecord::Migration
  def change
    create_table(:volunteers) do |t|
      t.integer  :uid, limit: 8
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
      t.string   :email
      t.string   :name

      t.timestamps
    end

    add_index :volunteers, :email,                :unique => true
    add_index :volunteers, :uid, :unique => true
    # add_index :volunteers, :confirmation_token,   :unique => true
    # add_index :volunteers, :unlock_token,         :unique => true
    # add_index :volunteers, :authentication_token, :unique => true
  end
end
