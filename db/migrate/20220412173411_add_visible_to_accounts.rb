class AddVisibleToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :visible, :boolean
  end
end
