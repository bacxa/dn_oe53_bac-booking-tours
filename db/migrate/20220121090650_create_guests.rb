class CreateGuests < ActiveRecord::Migration[6.1]
  def change
    create_table :guests do |t|
      t.references :booking, null: false
      t.string :name, null: false
      t.string :passport
      t.string :phone_number
      t.integer :status, default: 0
      t.datetime :dob

      t.timestamps
    end
  end
end
