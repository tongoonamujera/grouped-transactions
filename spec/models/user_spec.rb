require 'rails_helper'
#rubocop:disable all

RSpec.describe User, type: :model do
  let(:first_user) { User.create(username: 'tongoonam', email: 'tongoona@rspec.com', password: 'mujeratongo') }
  let(:second_user) { User.create(username: 'ton', email: 'ton@rspec.com', password: 'mujeratongo') }
  let(:third_user) { User.create(username: '', email: 'tong@rspec.com', password: 'mujeratongo') }
  let(:fourth_user) { User.create(username: 'tongooonamujeeeeraaaa',
                                  email: 'tongooonamujeeeeraaa@rspec.com', password: 'mujeratongo') }
  let(:user_transactions) { User.reflect_on_association(:user_transactions).macro }
  let(:groups) { User.reflect_on_association(:groups).macro }

  it 'checks validity of user' do
    expect(first_user).to be_valid
  end

  it 'username must not be empty' do
    expect(third_user).to_not be_valid
  end

  it 'username must not be less than six characters' do
    expect(second_user).to_not be_valid
  end

  it 'username must not be more than 20 characters' do
    expect(fourth_user).to_not be_valid
  end

  it 'should check correct association' do
    expect(user_transactions).to eq(:has_many)
  end

  it 'should check correct association' do
    expect(groups).to eq(:has_many)
  end
end
