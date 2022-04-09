class ChangeDateTyoe < ActiveRecord::Migration[7.0]
  def change
    remove_column :transactions, :date
    add_column :transactions, :date, :date
  end
end
