class Category < ApplicationRecord
  belongs_to :user, optional: true

  validates :title, presence: true, length: { maximum: 50 }, uniqueness: { scope: :user_id }
  validates :icon, presence: true
end
