class RenamePostCommentsToComments < ActiveRecord::Migration
  def change
  	rename_table :post_comments, :comments
  end
end
