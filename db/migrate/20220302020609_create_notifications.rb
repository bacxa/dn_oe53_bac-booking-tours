class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.references :to_user, null: false
      t.references :from_user
      t.references :booking
      t.boolean :seen, default: false
      t.integer :key

      t.timestamps
    end
  end
end
