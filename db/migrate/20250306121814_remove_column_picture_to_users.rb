class RemoveColumnPictureToUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :picture, :text
  end
end
