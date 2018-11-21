class Char < ApplicationRecord
  belongs_to :user
  has_many :known_spells
  has_many :spells, through: :known_spells
end
