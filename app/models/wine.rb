class Wine < ApplicationRecord
  belongs_to :user
  belongs_to :varietal
 

  accepts_nested_attributes_for :varietal
  
  validates :name, presence: true

  with_options if: :bottled? do |wine|
    wine.validates :bottled_date, presence: true
    wine.validates :bottled_date, numericality: {
      less_than_or_equal_to: Date.today.year
    }
  end

  def bottled?
    bottled
  end

  scope :bottled, -> { where.not(bottled: nil) }
  scope :not_bottled, -> { where(bottled: nil) }
  scope :recent_bottled_wines, -> { self.bottled.where("bottled_date > ?", 5.years.ago) }
  scope :sorted_bottled_wines, -> { self.bottled.order(bottle_date: :desc)}
  scope :search, -> (term) { self.sorted_bottled_wines.where("name LIKE ?", "%#{term}%") }
 
 
  
end
