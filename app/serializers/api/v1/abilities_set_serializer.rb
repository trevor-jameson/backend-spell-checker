class Api::V1::AbilitiesSetSerializer < ActiveModel::Serializer
  attributes :str, :dex, :con, :int, :wis, :cha
  has_one :char
end
