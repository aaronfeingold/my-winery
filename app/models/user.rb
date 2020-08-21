class User < ApplicationRecord
  has_many :wines
  has_many :varietals, through: :wines
  

  validates :email, presence: true, uniqueness: true
  
  has_secure_password
end
