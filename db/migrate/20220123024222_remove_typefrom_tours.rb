class RemoveTypefromTours < ActiveRecord::Migration[6.1]
  def change
    remove_column :tours, :type, :integer
  end
end
