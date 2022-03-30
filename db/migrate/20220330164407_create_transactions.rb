class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :date
      t.integer :amount

      t.timestamps
    end
  end
end
