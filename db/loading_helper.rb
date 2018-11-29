require_relative './making_helper.rb'

def load_klasses
  counter = 1
  12.times do
    make_klass(counter)
    counter += 1
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
  response = RestClient.get('http://dnd5eapi.co/api/spells')
  total_spells = JSON.parse(response)['count']
  counter = 1

  # Make call for each spell's data times the count var in above return
  total_spells.times do
    make_spell(counter)
    counter += 1
  end
end
