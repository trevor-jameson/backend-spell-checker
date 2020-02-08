class AbilitiesSet < ApplicationRecord
  belongs_to :char
  validates :char, uniqueness: true
end
