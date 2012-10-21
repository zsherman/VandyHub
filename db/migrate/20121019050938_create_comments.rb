class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.references :post
      t.references :user
      t.integer :votes
      t.timestamps
    end
  end
end
