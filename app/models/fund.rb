class Fund < ApplicationRecord
  belongs_to :category

  validates :title, presence: true, length: { maximum: 150 }
  validates :note, presence: true, length: { maximum: 255 }

  def last_funds
    category.funds.order(created_at: :desc).limit(10)
  end

  def last_incomes
    category.funds.where(type_declaration: 'incomes').order(date: :desc).limit(10)
  end

  def last_expenses
    category.funds.where(type_declaration: 'expenses').order(date: :desc).limit(10)
  end
end
