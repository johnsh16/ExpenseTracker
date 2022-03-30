class AddVisibleToTransaction < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :visible, :boolean
  end
end
