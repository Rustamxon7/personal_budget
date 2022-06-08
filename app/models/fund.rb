class Fund < ApplicationRecord
  belongs_to :category

  validates :title, presence: true, length: { maximum: 150 }
  validates :note, presence: true, length: { maximum: 255 }
  validates :amount, presence: true, numericality: { greater_than: 0 }

  scope :last_funds, lambda { |type_declaration, limit|
    where(type_declaration: type_declaration).order(created_at: :desc).limit(limit)
  }
end
