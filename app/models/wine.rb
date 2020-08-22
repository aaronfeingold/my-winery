class Wine < ApplicationRecord
  belongs_to :user
  belongs_to :varietal
 

  accepts_nested_attributes_for :varietal
  
  validates :name, presence: true

  # with_options if: :bottled? do |wine|
  #   wine.validates :bottled_date, presence: true
  #   wine.validates :bottled_date, date: {
  #     less_than_or_equal_to: Date.today
  #   }
  # end

  # def bottled?
  #   bottled
  # end

  scope :bottled, -> { where.not(bottled: nil) }
  scope :not_bottled, -> { where.not(bottled: true) }
  scope :sorted_not_bottled_wines, -> { self.not_bottled.order(name: :desc)}
  scope :search, -> (term) { self.sorted_not_bottled_wines.where("name LIKE ?", "%#{term}%") }
 
 
  
end
