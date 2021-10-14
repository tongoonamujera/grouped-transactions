require 'rails_helper'
#rubocop:disable all

RSpec.describe GroupTransaction, type: :model do
  let(:first_user) { User.create(username: 'tongoonam', email: 'tongoona@rspec.com', password: 'mujeratongo') }
  let(:first_group) { Group.create(name: 'first group', user_id: first_user.id) }
  let(:first_transaction) { UserTransaction.create(name: 'tonaaaa', amount: 20, user_id: first_user.id) }
  let(:group_transaction_first) { GroupTransaction.create(group_id: first_group.id,
                                                          user_transaction_id: first_transaction.id) }
  let(:group_transaction_second) { GroupTransaction.create(group_id: '', user_transaction_id: first_transaction.id) }
  let(:group_transaction_last) { GroupTransaction.create(group_id: first_group.id, user_transaction_id: '') }

  it 'checks validity of a group_transaction' do
    expect(group_transaction_first).to be_valid
  end

  it 'group_id must not be empty' do
    expect(group_transaction_second).to_not be_valid
  end

  it 'user_transaction_id must not be nil or empty' do
    expect(group_transaction_last).to_not be_valid
  end
end
