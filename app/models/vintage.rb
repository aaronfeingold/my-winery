class Vintage < ApplicationRecord
  has_many :wines
  has_many :users, through: :wines
end
