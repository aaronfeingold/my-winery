class User < ApplicationRecord
  has_many :wines
  has_many :vineyards, through: :wines
  has_many :varietals, through: :vineyards

  validates :email, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  
  has_secure_password
end
