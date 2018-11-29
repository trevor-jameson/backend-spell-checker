class KnownSpell < ApplicationRecord
  belongs_to :char, dependent: :delete
  belongs_to :spell
end
