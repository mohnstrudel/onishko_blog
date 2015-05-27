class CreatePostComments < ActiveRecord::Migration
  def change
    create_table :post_comments do |t|
      t.text :body
      t.string :title
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
