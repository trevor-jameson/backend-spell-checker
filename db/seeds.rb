require 'rest-client'
require 'json'
require 'byebug'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Spell.destroy_all
Char.destroy_all
User.destroy_all

def load_spells
  counter = 1
  319.times do
    make_spell(counter)
    counter += 1
  end
end

def join_arr(item, space='')
  if item != nil
    return item.join(space)
  end
end

def check_bool(item)
  if item == 'no'
    return false
  else
    return true
  end
end

def select_classes(classes)
  if classes.size == 1
    return classes[0]['name']
  elsif classes == nil
    return nil
  else
    class_arr = classes.collect {|class_obj| class_obj['name']}
    return join_arr(class_arr, ' ')
  end
end

# testing response
def make_spell(counter)
  response = RestClient.get('http://dnd5eapi.co/api/spells/' + counter.to_s)
  json = JSON.parse(response)

  if json != nil
    spell = Spell.new(
      api_id: json['_id'],
      api_index: json['index'],
      name: json['name'],
      desc: join_arr(json['desc']),
      highlvl: join_arr(json['higher_level']),
      page: json['page'],
      range: json['range'],
      components: join_arr(json['components'], ' '),
      material: json['material'],
      ritual: check_bool(json['ritual']),
      duration: json['duration'],
      concentration: check_bool(json['concentration']),
      classes: select_classes(json['classes']),
      castingtime: json['casting_time'],
      level: json['level'],
      school: json['school']['name'],
      url: json['url'],
    )
    if spell.valid?
      spell.save
    end
  end
end

load_spells
