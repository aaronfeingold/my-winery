class Varietal < ApplicationRecord
  belongs_to :wine
  belongs_to :vineyard
end
