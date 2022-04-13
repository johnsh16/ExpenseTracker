class AddGroupToTransaction < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :group, :string
  end
end
