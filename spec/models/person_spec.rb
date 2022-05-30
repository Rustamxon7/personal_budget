require 'rails_helper'

RSpec.describe Person, type: :model do
  before(:each) do
    @user = User.create!(
      name: 'Example User',
      email: 'test@test.com',
      password: '123456'
    )
  end

  describe 'If person valid' do
    context 'when the person is valid' do
      it 'returns true' do
        person = Person.new(
          name: 'test',
          icon: 'test',
          user_id: @user.id
        )
        expect(person.valid?).to be true
      end
    end
  end

  describe 'If person invalid' do
    context 'when the person is invalid' do
      it 'returns false' do
        # person belongs_to user
        person = Person.new(
          name: '',
          icon: '',
          user: @user
        )
        expect(person.valid?).to be false
      end
    end
  end

  describe 'If person is not unique' do
    context 'when the person is not unique' do
      it 'returns false' do
        person = Person.new(
          name: 'test',
          icon: 'test',
          user_id: @user.id
        )
        person.save
        person2 = Person.new(
          name: 'test',
          icon: 'test',
          user_id: @user.id
        )
        expect(person2.valid?).to be false
      end
    end
  end

  describe 'If person more than 50 characters' do
    context 'when the person is more than 50 characters' do
      it 'returns false' do
        person = Person.new(
          name: 'a' * 51,
          icon: 'test',
          user_id: @user.id
        )
        expect(person.valid?).to be false
      end
    end
  end
end
