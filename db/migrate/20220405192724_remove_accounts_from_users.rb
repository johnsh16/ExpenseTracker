class RemoveAccountsFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :accounts
  end
end
