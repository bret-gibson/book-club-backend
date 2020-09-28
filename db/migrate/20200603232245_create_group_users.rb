class CreateGroupUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :group_users do |t|
      t.integer :user_id, :limit => 8
      t.integer :group_id, :limit => 8

      t.timestamps
    end
  end
end
