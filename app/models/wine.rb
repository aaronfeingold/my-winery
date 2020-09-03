class Wine < ApplicationRecord
  belongs_to :user
  belongs_to :varietal
 

  accepts_nested_attributes_for :varietal, reject_if: :all_blank
  
  validates :name, presence: true
  # validates :barrel, numericality: { only_integer: true }
  validate :bottled_date_cannot_be_in_the_future

  # def validate!
  #   errors.add(:name, :blank, message: "cannot be nil") if name.nil?
  # end
  
  def bottled_date_cannot_be_in_the_future
    if bottled_date.present? && bottled_date > Date.today
      errors.add(:bottled_date, "can't be in the future")
    end
  end

  scope :bottled, -> { where.not(bottled: nil) }
  scope :not_bottled, -> { where.not(bottled: true) }
  scope :sorted_not_bottled_wines, -> { self.not_bottled.order(name: :desc)}
  scope :search, -> (term) { self.sorted_not_bottled_wines.where("name LIKE ?", "%#{term}%") }
 

end
