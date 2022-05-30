require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @user = User.create!(
      name: 'Example User',
      email: 'test@test.com',
      password: '123456'
    )
    @person = Person.create!(
      name: 'test',
      icon: 'test',
      user_id: @user.id
    )
  end

  describe 'If category valid' do
    context 'when the category is valid' do
      it 'returns true' do
        category = Category.new(
          title: 'test',
          icon: 'test',
          money: 'test',
          user_id: @user.id,
          person_id: @person.id
        )
        expect(category.valid?).to be true
      end
    end
  end

  describe 'If category invalid' do
    context 'when the category is invalid' do
      it 'returns false' do
        # category belongs_to user
        category = Category.new(
          title: '',
          icon: '',
          money: '',
          user: @user
        )
        expect(category.valid?).to be false
      end
    end
  end

  describe 'If category is not unique' do
    context 'when the category is not unique' do
      it 'returns false' do
        category = Category.new(
          title: 'test',
          icon: 'test',
          money: 'test',
          user_id: @user.id,
          person_id: @person.id
        )
        category.save
        category2 = Category.new(
          title: 'test',
          icon: 'test',
          money: 'test',
          user_id: @user.id,
          person_id: @person.id
        )
        expect(category2.valid?).to be false
      end
    end
  end
end
