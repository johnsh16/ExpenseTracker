class ChangeNameOfAccountInUserToAccounts < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :account, :accounts
  end
end
