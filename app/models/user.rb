class User < ApplicationRecord
  has_many :wines
  has_many :vintages, through: :wines
  

  validates :email, presence: true, uniqueness: true
  
  has_secure_password
end
