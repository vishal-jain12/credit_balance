class User < ApplicationRecord
  has_many :wallet_transactions
  has_one :wallet

  def get_transaction(user)
    user.wallet_transactions.group('strftime("%B-%Y", date)').group('transaction_type').sum(:amount)
  end

  def transaction
    user_hash = {}
    User.all.each do |user|
      user_hash[user.name] = {}
      user_hash[user.name]['Initial Balance'] = user.wallet.total_amount
      monthly_transactions = get_transaction(user)
      monthly_transactions.each do |month, value|
        date = month[0].split('-')
        user_hash[user.name][month[0]] ||= {}
        user_hash[user.name][month[0]][month[1]] = value
      end
    end
    p user_hash
  end
end
