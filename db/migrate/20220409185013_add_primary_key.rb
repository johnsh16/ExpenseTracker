class AddPrimaryKey < ActiveRecord::Migration[7.0]
  def change
    change_column :transactions, :id, :primary_key
  end
end
