class Category < ApplicationRecord
  has_many :products, dependent: :nullify

  scope :top_level, -> { where(parent_id: nil) }

  validates :name, :slug, presence: true
  validates :slug, uniqueness: true
end
