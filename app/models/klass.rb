class Klass < ApplicationRecord
  has_many :char_klasses
  has_many :chars, through: :char_klasses
  has_many :klass_levels
end
