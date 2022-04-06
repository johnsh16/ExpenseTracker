class RemoveId < ActiveRecord::Migration[7.0]
  def change
    remove_column :transactions, :id
  end
end
