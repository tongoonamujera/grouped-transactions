class ExternalTransactionsController < ApplicationController
  def index
    a = current_user.user_transactions.pluck(:id)
    b = GroupTransaction.where('user_transaction_id IN (?)', a).pluck(:user_transaction_id)
#rubocop:disable all
    if b.empty?
      @external_transactions = current_user.user_transactions
    else
      @external_transactions = current_user.user_transactions.where.not('id IN (?)', b).order(created_at: :desc)
    end
  end
end
