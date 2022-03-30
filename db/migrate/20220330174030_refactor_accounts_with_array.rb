class RefactorAccountsWithArray < ActiveRecord::Migration[7.0]
  def change
    remove_column :accounts, :user
    add_column :accounts, :user, :integer
    add_column :transactions, :account, :integer
    add_column :accounts, :transactions, :integer, array: true
    add_column :users, :account, :integer, array: true
  end
end
