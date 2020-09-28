class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :user_id, :limit => 8
      t.integer :group_book_id, :limit => 8
      t.string :content
      t.integer :parent_id, :limit => 8

      t.timestamps
    end
  end
end
