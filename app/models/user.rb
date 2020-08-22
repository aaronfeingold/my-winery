class User < ApplicationRecord
  has_many :wines
  has_many :varietals, through: :wines
  

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 13 }
  
  has_secure_password
end
