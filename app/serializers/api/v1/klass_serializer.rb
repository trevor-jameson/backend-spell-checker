class Api::V1::KlassSerializer < ActiveModel::Serializer
  attributes :id, :name, :hitdie
  belongs_to :char
end
