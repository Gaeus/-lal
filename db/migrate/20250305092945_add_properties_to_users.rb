class AddPropertiesToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :properties, :string, array: true, default: []
  end
end
