class AddSortToTours < ActiveRecord::Migration[6.1]
  def change
    add_column :tours, :sort, :integer, default: 0
  end
end
