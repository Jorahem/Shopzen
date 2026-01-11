class User < ApplicationRecord
  enum role: { customer: 0, seller: 1, admin: 2 }

  # Devise will be added later; placeholder validations
  validates :email, presence: true, uniqueness: true
end
