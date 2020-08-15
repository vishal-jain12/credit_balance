class Wallet < ApplicationRecord
  has_many :wallet_transactions
  belongs_to :user
end
