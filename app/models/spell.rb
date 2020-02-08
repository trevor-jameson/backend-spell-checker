class Spell < ApplicationRecord
  has_many :known_spells, dependent: :destroy
  has_many :chars, through: :known_spells
  validates :name, { uniqueness: true}
end
