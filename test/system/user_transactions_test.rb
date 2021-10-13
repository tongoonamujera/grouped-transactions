require 'application_system_test_case'

class UserTransactionsTest < ApplicationSystemTestCase
  setup do
    @user_transaction = user_transactions(:one)
  end

  test 'visiting the index' do
    visit user_transactions_url
    assert_selector 'h1', text: 'User Transactions'
  end

  test 'creating a User transaction' do
    visit user_transactions_url
    click_on 'New User Transaction'

    fill_in 'Amount', with: @user_transaction.amount
    fill_in 'Name', with: @user_transaction.name
    fill_in 'User', with: @user_transaction.user_id
    click_on 'Create User transaction'

    assert_text 'User transaction was successfully created'
    click_on 'Back'
  end

  test 'updating a User transaction' do
    visit user_transactions_url
    click_on 'Edit', match: :first

    fill_in 'Amount', with: @user_transaction.amount
    fill_in 'Name', with: @user_transaction.name
    fill_in 'User', with: @user_transaction.user_id
    click_on 'Update User transaction'

    assert_text 'User transaction was successfully updated'
    click_on 'Back'
  end

  test 'destroying a User transaction' do
    visit user_transactions_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'User transaction was successfully destroyed'
  end
end
