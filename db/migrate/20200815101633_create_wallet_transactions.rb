class CreateWalletTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :wallet_transactions do |t|
      t.string :amount
      t.string :transaction_type

      t.timestamps
    end
  end
end
