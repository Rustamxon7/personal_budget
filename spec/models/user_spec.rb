require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'If user valid' do
    context 'when the user is valid' do
      it 'returns true' do
        user = User.new(
          email: 'test@test.com',
          password: '123456',
        )
        expect(user.valid?).to be true
      end
    end
  end

  describe 'If user invalid' do
    context 'when the user is invalid' do
      it 'returns false' do
        user = User.new(
          email: 'not',
          password: 'not',
        )
        expect(user.valid?).to be false
      end
    end
  end

  describe 'If user is not unique' do
    context 'when the user is not unique' do
      it 'returns false' do
        user = User.new(
          email: 'test@test.com',
          password: '123456',
        )
        user.save
        user2 = User.new(
          email: 'test@test.com',
          password: '123456',
        )
        expect(user2.valid?).to be false
      end
    end
  end
end
