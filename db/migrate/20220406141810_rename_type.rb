class RenameType < ActiveRecord::Migration[7.0]
  def change
    rename_column :transactions, :type, :trans_type
  end
end
