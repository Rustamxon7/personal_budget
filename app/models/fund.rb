class Fund < ApplicationRecord
  belongs_to :category

  validates :title, presence: true, length: { maximum: 50 }, uniqueness: { scope: :category_id }
end
