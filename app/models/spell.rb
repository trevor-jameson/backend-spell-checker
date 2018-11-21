class Spell < ApplicationRecord
  has_many :known_spells
  has_many :chars, through: :known_spells
end
