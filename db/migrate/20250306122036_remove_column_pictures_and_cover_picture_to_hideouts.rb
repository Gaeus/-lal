class RemoveColumnPicturesAndCoverPictureToHideouts < ActiveRecord::Migration[7.1]
  def change
    remove_column :hideouts, :pictures, :string
    remove_column :hideouts, :cover_picture, :string
  end
end
