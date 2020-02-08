class KnownSpell < ApplicationRecord
  belongs_to :char
  belongs_to :spell
end
