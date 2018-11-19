class Spell < ApplicationRecord
  has_many :char_spells
  has_many :chars, through: :char_spells
end
