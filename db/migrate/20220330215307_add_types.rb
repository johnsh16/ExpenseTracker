class AddTypes < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :theme, :string
    add_column :transactions, :type, :string
    add_column :accounts, :type, :string
  end
end
