require 'test_helper'
#rubocop:disable all
class GroupTransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group_transaction = group_transactions(:one)
  end

  test 'should get index' do
    get group_transactions_url
    assert_response :success
  end

  test 'should get new' do
    get new_group_transaction_url
    assert_response :success
  end

  test 'should create group_transaction' do
    assert_difference('GroupTransaction.count') do
      post group_transactions_url, params: { group_transaction: { group_id: @group_transaction.group_id, user_transaction_id: @group_transaction.user_transaction_id } }
    end

    assert_redirected_to group_transaction_url(GroupTransaction.last)
  end

  test 'should show group_transaction' do
    get group_transaction_url(@group_transaction)
    assert_response :success
  end

  test 'should get edit' do
    get edit_group_transaction_url(@group_transaction)
    assert_response :success
  end

  test 'should update group_transaction' do
    patch group_transaction_url(@group_transaction), params: { group_transaction: { group_id: @group_transaction.group_id, user_transaction_id: @group_transaction.user_transaction_id } }
    assert_redirected_to group_transaction_url(@group_transaction)
  end

  test 'should destroy group_transaction' do
    assert_difference('GroupTransaction.count', -1) do
      delete group_transaction_url(@group_transaction)
    end

    assert_redirected_to group_transactions_url
  end
end
