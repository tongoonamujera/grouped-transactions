require 'rails_helper'

RSpec.describe UserTransaction, type: :model do
  let(:first_user) { User.create(username: 'tongoonam', email: 'tongoona@rspec.com', password: 'mujeratongo') }
  let(:first_transaction) { UserTransaction.create(name: 'tonaaaa', amount: 20, user_id: first_user.id) }
  let(:second_transaction) { UserTransaction.create(name: '', amount: 30, user_id: first_user.id) }
  let(:third_transaction) { UserTransaction.create(name: 'ton', amount: 30, user_id: first_user.id) }
  let(:fourth_transaction) { UserTransaction.create(name: 'tonggggggggonnjasdhjksdfghjdfghjdfghdfgh',
                                                    amount: 30, user_id: first_user.id) }
  let(:fifth_transaction) { UserTransaction.create(name: 'tongoona', amount: '', user_id: first_user.id) }
  let(:last_transaction) { UserTransaction.create(name: 'tongoona', amount: 30, user_id: '') }
  let(:group_transactions) { UserTransaction.reflect_on_association(:group_transactions).macro }

  it 'checks validity of a transaction' do
    expect(first_transaction).to be_valid
  end

  it 'name must not be empty' do
    expect(second_transaction).to_not be_valid
  end

  it 'user_id  must not be empty or nil' do
    expect(last_transaction).to_not be_valid
  end

  it 'amount must not be empty' do
    expect(fifth_transaction).to_not be_valid
  end

  it 'name must not be less than six characters' do
    expect(third_transaction).to_not be_valid
  end

  it 'username must not be more than 25 characters' do
    expect(fourth_transaction).to_not be_valid
  end

  it 'should check correct association' do
    expect(group_transactions).to eq(:has_many)
  end
end
