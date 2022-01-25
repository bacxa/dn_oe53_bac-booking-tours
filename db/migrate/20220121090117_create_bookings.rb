class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false
      t.references :tour, null: false
      t.integer :status, default: 0
      t.datetime :est_start_date
      t.datetime :start_date

      t.timestamps
    end
  end
end
