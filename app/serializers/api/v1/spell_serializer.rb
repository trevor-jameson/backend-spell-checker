class Api::V1::SpellSerializer < ActiveModel::Serializer
  attributes :id, :name, :desc, :highlvl, :page, :range, :components, :ritual, :concentration, :duration, :castingtime, :material, :lvl, :school, :klasses
end
