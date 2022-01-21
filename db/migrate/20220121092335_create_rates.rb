class CreateRates < ActiveRecord::Migration[6.1]
  def change
    create_table :rates do |t|
      t.references :user, null: false
      t.references :tour, null: false
      t.integer :rating, null: false
      t.string :comment, null: false

      t.timestamps
    end
  end
end
