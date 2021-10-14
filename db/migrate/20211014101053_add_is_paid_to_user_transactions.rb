class AddIsPaidToUserTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :user_transactions, :is_paid, :boolean
  end
end
