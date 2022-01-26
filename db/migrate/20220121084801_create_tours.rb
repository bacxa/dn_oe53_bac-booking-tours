class CreateTours < ActiveRecord::Migration[6.1]
  def change
    create_table :tours do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :price, default: false
      t.integer :sort, default: 0
      t.integer :max_guest
      t.integer :min_guest
      t.string :duration
      t.string :info_regular

      t.timestamps
    end
  end
end
