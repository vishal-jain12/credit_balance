class AddDateToWalletTransaction < ActiveRecord::Migration[6.0]
  def change
    add_column :wallet_transactions, :date, :date
  end
end
