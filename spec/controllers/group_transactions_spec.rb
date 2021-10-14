require 'rails_helper'
#rubocop:disable all

RSpec.describe 'GroupTransactions controller', type: :model do
  let(:user1) { User.create(username: 'Tongoona', email: 'tongoona@gmail.com', password: 'aaaaaaaa') }
  let(:first_transaction) { UserTransaction.create(name: 'tonaaaa', amount: 20, user_id: user1.id) }
  let(:first_group) { Group.create(name: 'first group', user_id: user1.id) }
  let(:group_transaction_first) { GroupTransaction.create(group_id: first_group.id,
                                                          user_transaction_id: first_transaction.id) }

  describe 'GET index' do
    it 'should show group transaction with his id' do
      group = GroupTransaction.find(group_transaction_first.id)
      expect(group).to eq(group_transaction_first)
    end

    it 'should find group id' do
      group = GroupTransaction.find(group_transaction_first.id).group_id
      expect(group).to eq(first_group.id)
    end

    it 'should find group id' do
      group = GroupTransaction.find(group_transaction_first.id).user_transaction_id
      expect(group).to eq(first_transaction.id)
    end
  end
end
