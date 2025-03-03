class CreateHideouts < ActiveRecord::Migration[7.1]
  def change
    create_table :hideouts do |t|

      t.timestamps
    end
  end
end
