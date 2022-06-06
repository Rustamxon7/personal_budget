class Person < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: { scope: :user_id }
  validates :icon, presence: true

  has_many :categories, dependent: :destroy

  after_save :update_categories

  private

  def update_categories
    categories.each do |category|
      category.update(person_id: id)
    end
  end
end
