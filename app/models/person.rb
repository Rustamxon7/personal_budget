class Person < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: { scope: :user_id }
  validates :icon, presence: true

  has_many :categories, dependent: :destroy
end
