json.extract! user_transaction, :id, :name, :amount, :user_id, :created_at, :updated_at
json.url user_transaction_url(user_transaction, format: :json)
