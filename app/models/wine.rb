class Wine < ApplicationRecord
  belongs_to :user
  belongs_to :vintage
 

  accepts_nested_attributes_for :vintage 
  validates :name, presence: true

  scope :bottled, -> { where.not(bottled_date: nil) }
  scope :not_bottled, -> { where(bottled_date: nil) }
  scope :recent_bottled_wines, -> { self.bottled.where("bottled_date > ?", 5.years.ago) }
  scope :sorted_bottled_wines, -> { self.bottled.order(bottle_date: :desc)}
  scope :search, -> (term) { self.sorted_bottled_wines.where("name LIKE ?", "%#{term}%") }

end
