class Fund < ApplicationRecord
  belongs_to :category

  validates :title, presence: true, length: { maximum: 50 }, uniqueness: { scope: :category_id }
  validates :note, presence: true, length: { maximum: 255 }
end
