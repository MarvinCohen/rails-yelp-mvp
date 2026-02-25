class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

   CATEGORY = %w[chinese italian japanese french belgian]
  validates :name, :address, presence: true
  validates :category, inclusion: { in: Restaurant::CATEGORY }
end
