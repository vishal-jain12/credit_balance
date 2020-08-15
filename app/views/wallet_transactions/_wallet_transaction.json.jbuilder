json.extract! wallet_transaction, :id, :amount, :type, :created_at, :updated_at
json.url wallet_transaction_url(wallet_transaction, format: :json)
