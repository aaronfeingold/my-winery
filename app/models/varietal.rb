# frozen_string_literal: true

class Varietal < ApplicationRecord
  has_many :wines
  has_many :users, through: :wines

  validates_uniqueness_of :name
end
