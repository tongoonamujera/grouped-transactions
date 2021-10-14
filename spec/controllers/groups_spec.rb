require 'rails_helper'

RSpec.describe 'Groups controller', type: :model do
  let(:user1) { User.create(username: 'Tongoona', email: 'tongoona@gmail.com', password: 'aaaaaaaa') }
  let(:first_group) { Group.create(name: 'first group', user_id: user1.id) }
  let(:second_group) { Group.create(name: 'second group', user_id: user1.id) }

  describe 'GET index' do
    it 'should show group with hts id' do
      group = Group.find(first_group.id)
      expect(group).to eq(first_group)
    end

    it 'should show group with its name' do
      second = Group.find(second_group.id).name
      expect(second).to eq('second group')
    end
  end
end
