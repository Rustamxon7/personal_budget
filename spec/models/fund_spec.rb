require 'rails_helper'

RSpec.describe Fund, type: :model do
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
    @category = Category.create!(
      title: 'test',
      icon: 'test',
      money: 'test',
      user_id: @user.id,
      person_id: @person.id
    )
  end

  describe 'If fund valid' do
    context 'when the fund is valid' do
      it 'returns true' do
        fund = Fund.new(
          title: 'test',
          amount: 999,
          date: '2020-05-25',
          category_id: @category.id
        )
        expect(fund.valid?).to be true
      end
    end
  end

  describe 'If fund invalid' do
    context 'when the fund is invalid' do
      it 'returns false' do
        # fund belongs_to category
        fund = Fund.new(
          title: '',
          amount: 999,
          date: '2020-05-25',
          category: @category
        )
        expect(fund.valid?).to be false
      end
    end
  end

  describe 'If fund is not unique' do
    context 'when the fund is not unique' do
      it 'returns false' do
        fund = Fund.new(
          title: 'test',
          amount: 999,
          date: '2020-05-25',
          category_id: @category.id
        )
        fund.save
        fund2 = Fund.new(
          title: 'test',
          amount: 999,
          date: '2020-05-25',
          category_id: @category.id
        )
        expect(fund2.valid?).to be false
      end
    end
  end

  describe 'If fund is unique' do
    context 'when the fund is unique' do
      it 'returns true' do
        fund = Fund.new(
          title: 'test',
          amount: 999,
          date: '2020-05-25',
          category_id: @category.id
        )
        fund.save
        fund2 = Fund.new(
          title: 'test2',
          amount: 999,
          date: '2020-05-25',
          category_id: @category.id
        )
        expect(fund2.valid?).to be true
      end
    end
  end
end
