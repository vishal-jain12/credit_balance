class WalletTransaction < ApplicationRecord
  belongs_to :user
  belongs_to :wallet

  scope :debit_transaction, -> { where(transaction_type: 'Debit') }
  scope :credit_transaction, -> { where(transaction_type: 'Credit') }
end
