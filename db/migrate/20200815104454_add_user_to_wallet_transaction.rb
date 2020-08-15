class AddUserToWalletTransaction < ActiveRecord::Migration[6.0]
  def change
    add_reference :wallet_transactions, :user, null: false, foreign_key: true
    add_reference :wallet_transactions, :wallet, null: false, foreign_key: true
  end
end
