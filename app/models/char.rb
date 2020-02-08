class Char < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_one :abilities_set, dependent: :destroy
  has_many :known_spells, dependent: :destroy
  has_many :spells, through: :known_spells
  has_many :char_klasses, dependent: :destroy
  has_many :klasses, through: :char_klasses
  has_many :klass_levels, through: :klasses do
    def belongs(char)
      # TODO: FINISH CUSTOM RELATIONSHIP METHOD (ASK PAUL FOR HELP WITH WHERE QUERY)
      ck_matches = object.char_klasses.map {|ck| {klass: ck.klass_id, lvl: ck.klass_lvl}}
      # Custom method will return assocations once you learn how to reference
      # the char object within here
      where()
    end
  end

  # VALIDATIONS
  # Checkbox from front-end must be true. However, this attr will not be stored in backend
  # as acceptance is implicit on char creation
  validates :terms_of_life, acceptance: true
end
