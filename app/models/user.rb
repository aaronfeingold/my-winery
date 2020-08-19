class User < ApplicationRecord
  has_many :wines

  validates :email, presence: true, uniqueness: true
  has_secure_password
end
