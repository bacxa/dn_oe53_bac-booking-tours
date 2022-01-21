class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :user, null: false
      t.string :title, null: false
      t.string :content, null: false
      t.integer :type, default: 0

      t.timestamps
    end
  end
end
