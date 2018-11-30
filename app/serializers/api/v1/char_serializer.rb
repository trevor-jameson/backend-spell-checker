class Api::V1::CharSerializer < ActiveModel::Serializer
  attributes :name, :notes, :health
  has_many :char_klasses
  has_many :spells
  has_one :abilities_set
  has_many :klasses
  has_many :klass_levels
end
