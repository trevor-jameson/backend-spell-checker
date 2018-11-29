class Char < ApplicationRecord
  belongs_to :user, dependent: :delete
  has_one :abilities_set
  has_many :known_spells
  has_many :spells, through: :known_spells
  has_many :char_klasses
  has_many :klasses, through: :char_klasses

  # VALIDATIONS
  # Checkbox from front-end must be true. However, this attr will not be stored in backend
  # as acceptance is implicit on char creation
  validates :terms_of_life, acceptance: true
end
