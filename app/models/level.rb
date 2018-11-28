class Level < ApplicationRecord
  has_many :klass_levels
  has_many :klasses, through: :klass_levels
end
