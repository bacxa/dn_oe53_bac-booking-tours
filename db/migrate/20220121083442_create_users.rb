class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest
      t.string :name
      t.integer :role, default: 0
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
