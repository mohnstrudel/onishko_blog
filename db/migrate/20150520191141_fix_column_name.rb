class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :posts, :category, :category_id
  	change_column :posts, :category_id, :integer
  end
end
