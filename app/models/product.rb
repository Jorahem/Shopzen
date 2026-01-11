class Product < ApplicationRecord
  belongs_to :category
  belongs_to :seller, class_name: 'User', optional: true

  validates :name, :slug, :price, presence: true

  def discounted_price
    compare_at_price.present? && compare_at_price > price ? price : price
  end
end
