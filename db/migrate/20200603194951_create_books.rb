class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :summary
      t.integer :pages, :limit => 8
      t.integer :average_rating, :limit => 8
      t.integer :isbn13, :limit => 8
      t.integer :isbn10, :limit => 8
      t.string :thumbnail

      t.timestamps
    end
  end
end
