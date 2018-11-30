class Api::V1::CharSerializer < ActiveModel::Serializer
  attributes :name, :notes, :health
  has_many :char_klasses
  has_many :spells
  has_one :abilities_set
  has_many :klasses
  has_many :klass_levels do
    # Create array of matched klasses and levels

    ck_matches = object.char_klasses.map {|ck| {klass: ck.klass_id, lvl: ck.klass_lvl}}

    # Has many klass levels where klass id is one of char's ids and ...
    # level is one of char's char_klasses levels

    # Association error. Maybe has_many is not expecting an arr
    # TODO: REDO WILDLY INNEFFICIENT QUERY
    ck_matches.map do |ck|
      byebug
      KlassLevel.all.find do |kl|
        kl.level == ck[:lvl] && kl.klass_id == ck[:klass]
      end
    end
  end
end
