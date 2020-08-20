class Wine < ApplicationRecord
  belongs_to :user
  belongs_to :vineyard
  has_many :varietals
  has_many :vineyards, through: :varietals

  validates :name, presence: true

  # validate :check_dates
  
  accepts_nested_attributes_for :vineyards
  accepts_nested_attributes_for :varietals

  scope :bottled, -> { where.not(bottled_date: nil) }
  scope :not_bottled, -> { where(bottled_date: nil) }
  scope :recent_bottled_wines, -> { self.bottled.where("bottled_date > ?", 5.years.ago) }
  scope :sorted_bottled_wines, -> { self.bottled.order(bottle_date: :desc)}

  # private
  #   def check_dates
  #     # release_year_exists =  Wine.where(title: self.title, bottled_date: self.bottled_date)
  #     if self.vintage && self.bottled_date
  #       if self.bottled_date.year < self.vintage 
  #       self.errors.add(:bottled_date, "How can you bottle a vintage before the vintage grows? Try again")
  #     # elsif !release_year_exists.empty?
  #     #   self.errors.add(:bottled_date, "Can't be released the same year")
  #     end
  #   end
end
