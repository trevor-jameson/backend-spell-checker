require_relative './making_helper.rb'

def load_klasses
  all_klasses = RestClient.get('http://dnd5eapi.co/api/classes')
  parsed_klasses= JSON.parse(all_klasses)
  
  parsed_klasses['results'].each do |klass|
    make_klass(klass)
  end
end

def load_klass_levels(klass_name)
  level_counter = 1
  20.times do
    make_klass_level(klass_name, level_counter)
    level_counter += 1
  end
end

# Call dnd api and seed spells to DB
def load_spells
  all_spells = RestClient.get('http://dnd5eapi.co/api/spells')
  parsed_spells = JSON.parse(all_spells)
  
  # Make call for each spell's data times the count var in above return
  parsed_spells['results'].each do |spell_hash|
    make_spell(spell_hash)
  end
end
