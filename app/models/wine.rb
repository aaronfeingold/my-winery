class Wine < ApplicationRecord
  has_many :varietals
  has_many :vineyards, through: :varietals

  scope :bottled, -> { where.not(bottled_date: nil) }
  scope :not_bottled, -> { where(bottled_date: nil) }
  scope :recent_bottled_wines, -> { self.bottled.where("bottled_date > ?", 5.years.ago) }
  scope :sorted_bottled_wines, -> { self.bottled.order(bottle_date: :desc)}
end
