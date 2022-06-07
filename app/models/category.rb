class Category < ApplicationRecord
  belongs_to :user
  belongs_to :person
  has_many :funds, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }
  validates :icon, presence: true
  validates :person_id, presence: true

  def sum_funds
    # sum all amounts of funds for each category
    funds.sum(:amount)
  end

  def last_funds
    funds.order(date: :desc).limit(10)
  end
end
