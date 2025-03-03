class AddColumnToHideout < ActiveRecord::Migration[7.1]
  def change
    add_column :hideouts, :address, :string
    add_column :hideouts, :price, :float
    add_column :hideouts, :overview, :text
    add_reference :hideouts, :user, index: true, foreign_key: true
  end
end
