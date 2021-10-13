require 'test_helper'
#rubocop:disable all
class ExternalTransactionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get external_transactions_index_url
    assert_response :success
  end

end
