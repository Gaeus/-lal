class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.date :date_start
      t.date :date_end
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :hideout, null: false, foreign_key: true

      t.timestamps
    end
  end
end
