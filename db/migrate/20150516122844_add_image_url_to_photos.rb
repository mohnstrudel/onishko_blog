class AddImageUrlToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :image, :string
  end
end
