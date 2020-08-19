class Wine < ApplicationRecord
  has_many :varietals
  has_many :vineyards, through: :varietals
end
