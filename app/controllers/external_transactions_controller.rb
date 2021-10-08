class ExternalTransactionsController < ApplicationController
  def index
    @external_transactions = UserTransaction.all
  end
end
