# frozen_string_literal: true

class Wine < ApplicationRecord
  belongs_to :user
  belongs_to :varietal

  accepts_nested_attributes_for :varietal, reject_if: :all_blank

  validates :name, presence: true
  validates :barrel, numericality: { only_integer: true }
  validate :bottled_date_cannot_be_in_the_future

  def bottled_date_cannot_be_in_the_future
    errors.add(:bottled_date, "can't be in the future") if bottled_date.present? && bottled_date > Date.today
  end

  scope :bottled, -> { where.not(bottled: nil) }
  scope :not_bottled, -> { where.not(bottled: true) }
  scope :sorted_not_bottled_wines, -> { not_bottled.order(name: :desc) }
  scope :search, ->(term) { sorted_not_bottled_wines.where('name LIKE ?', "%#{term}%") }
end
