class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :description
      t.string :image_url
      t.boolean :public
      t.integer :admin_user_id, :limit => 8

      t.timestamps
    end
  end
end
