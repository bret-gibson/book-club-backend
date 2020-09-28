class CreateGroupBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :group_books do |t|
      t.integer :group_id, :limit => 8
      t.integer :book_id, :limit => 8
      t.boolean :active
      t.string :status

      t.timestamps
    end
  end
end
