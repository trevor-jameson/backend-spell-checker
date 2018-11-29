class AbilitiesSet < ApplicationRecord

  # Cannot exist without a character and can only have one character
  # Attempting to delete a character without first deleting their abilities_set will cause an error
  belongs_to :char, dependent: :delete
  validates :char, uniqueness: true
end
