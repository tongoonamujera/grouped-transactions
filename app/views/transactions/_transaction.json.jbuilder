json.extract! transaction, :id, :price, :transaction_code, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
