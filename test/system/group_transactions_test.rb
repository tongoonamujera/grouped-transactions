require "application_system_test_case"

class GroupTransactionsTest < ApplicationSystemTestCase
  setup do
    @group_transaction = group_transactions(:one)
  end

  test "visiting the index" do
    visit group_transactions_url
    assert_selector "h1", text: "Group Transactions"
  end

  test "creating a Group transaction" do
    visit group_transactions_url
    click_on "New Group Transaction"

    fill_in "Group", with: @group_transaction.group_id
    fill_in "User transaction", with: @group_transaction.user_transaction_id
    click_on "Create Group transaction"

    assert_text "Group transaction was successfully created"
    click_on "Back"
  end

  test "updating a Group transaction" do
    visit group_transactions_url
    click_on "Edit", match: :first

    fill_in "Group", with: @group_transaction.group_id
    fill_in "User transaction", with: @group_transaction.user_transaction_id
    click_on "Update Group transaction"

    assert_text "Group transaction was successfully updated"
    click_on "Back"
  end

  test "destroying a Group transaction" do
    visit group_transactions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Group transaction was successfully destroyed"
  end
end
