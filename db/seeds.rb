# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{ name: 'Rohan' }, { name: 'Vivek' }])
users.each do |user|
  amount = rand(5000..10000)
  wallet = user.build_wallet(total_amount: amount)
  wallet.save
end

wallets = Wallet.all
wallets.each do |wallet|
  new_amount = 0
  wallet_amount = wallet.total_amount
  Date::MONTHNAMES.each_with_index do |month, index|
    next if month.nil?
    date = Date.new(2019, index)
    day = rand(1..date.end_of_month.day)
    new_date = Date.new(2019, index, day)
    (1..10).each do |i|
      debit_amount = rand(100..1000)
      debit_transaction = wallet.wallet_transactions.build(amount: debit_amount, transaction_type: 'Debit', date: new_date, user_id: wallet.user_id)
      debit_transaction.save
      credit_amount = rand(100..1000)
      credit_transaction = wallet.wallet_transactions.build(amount: credit_amount, transaction_type: 'Credit', date: new_date, user_id: wallet.user_id)
      credit_transaction.save
    end
  end
end