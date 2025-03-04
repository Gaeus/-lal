class AddPicturesToHideouts < ActiveRecord::Migration[7.1]
  def change
    add_column :hideouts, :cover_picture, :string
    add_column :hideouts, :pictures, :string, array: true, default: []
  end
end
