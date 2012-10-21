class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.references :user
      t.integer :views
      t.integer :votes 
      t.timestamps
    end
  end
end
