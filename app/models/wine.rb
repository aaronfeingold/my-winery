class Wine < ApplicationRecord
  belongs_to :user
  belongs_to :varietal
 

  accepts_nested_attributes_for :varietals
  
  validates :name, presence: true

 
  
end
