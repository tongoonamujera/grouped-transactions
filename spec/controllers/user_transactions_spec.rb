require 'rails_helper'

RSpec.describe 'UserTransactions controller', type: :model do
  let(:user1) { User.create(username: 'Tongoona', email: 'tongoona@gmail.com', password: 'aaaaaaaa') }
  let(:first_transaction) { UserTransaction.create(name: 'tonaaaa', amount: 20, user_id: user1.id) }
  let(:second_transaction) { UserTransaction.create(name: 'tonaaaaaaaaaa', amount: 20, user_id: user1.id) }

  describe 'GET index' do
    it 'should show user transaction with his id' do
      group = UserTransaction.find(first_transaction.id)
      expect(group).to eq(first_transaction)
    end

    it 'should show user transaction with  name' do
      second = UserTransaction.find(second_transaction.id).name
      expect(second).to eq('tonaaaaaaaaaa')
    end
  end
end
