class AddFirstNameToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :picture, :text
    add_column :users, :nickname, :string
    add_column :users, :is_public, :boolean
  end
end
