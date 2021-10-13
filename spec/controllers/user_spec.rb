
  
require 'rails_helper'

RSpec.describe 'User controller', type: :model do
  let(:user1) { User.create(username: 'Tongoona', email: 'tongoona@gmail.com', password: 'aaaaaaaa') }
  let(:user2) { User.create(username: 'Mujera', email: 'mujera@gmail.com', password: 'aaaaaaaa') }

  describe 'GET index' do
    it 'should show user with his id' do
      user = User.find(user1.id)
      expect(user).to eq(user1)
    end

    it 'should show user with id 1 name' do
      user = User.find(user1.id).username
      expect(user).to eq('Tongoona')
    end

    it 'should show user with id 1 email' do
      user = User.find(user1.id).email
      expect(user).to eq('tongoona@gmail.com')
    end
  end
end
