class AddNameColumnToHideouts < ActiveRecord::Migration[7.1]
  def change
    add_column :hideouts, :title, :string
  end
end
