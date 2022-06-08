# frozen_string_literal: true

class User < ApplicationRecord
  has_many :wines
  has_many :varietals, through: :wines

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }

  has_secure_password

  def self.find_or_create_from_omniauth(user_info)
    User.first_or_create(uid: user_info['uid']) do |user|
      user.email = "#{user_info['info']['nickname']}@something.com"
      user.password = Securerandom.hex
    end
  end
end
