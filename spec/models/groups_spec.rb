require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:first_user) { User.create(username: 'tongoonam', email:'tongoona@rspec.com', password: 'mujeratongo') }
  let(:first_group) { Group.create(name: 'first group', user_id: first_user.id) }
  let(:second_group) { Group.create(name: 'gro', user_id: first_user.id) }
  let(:third_group) { Group.create(name: 'lastg group', user_id: '') }
  let(:fourth_group) { Group.create(name: 'first group asdasdasdaddasaddasadadadaddad', user_id: first_user.id) }
  let(:last_group) { Group.create(name: '', user_id: first_user.id) }
  let(:group_transactions) { Group.reflect_on_association(:group_transactions).macro }

  it 'checks validity of a group' do
    expect(first_group).to be_valid
  end

  it 'name must not be empty' do
    expect(last_group).to_not be_valid
  end

  it 'name must not be less than six characters' do
    expect(second_group).to_not be_valid
  end

  it 'user_id must not be nil or empty' do
    expect(third_group).to_not be_valid
  end

  it 'name must not be more than 25 characters' do
    expect(fourth_group).to_not be_valid
  end

  it 'should check correct association' do
    expect(group_transactions).to eq(:has_many)
  end
end
