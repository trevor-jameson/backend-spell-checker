require 'rest-client'
require 'json'
require 'byebug'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

# Spell.destroy_all
Char.destroy_all
User.destroy_all

##### Seed demo users to the DB #####
def make_demo_users
  @user1 = User.create(username: "ImDungeonDan", firstname: "Daniel", lastname: "Esperanto", password: "issecurepassword", pic: "https://images.unsplash.com/photo-1514036783265-fba9577fc473?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=72b5b878461033230d57ba8b7f4315ee&auto=format&fit=crop&w=800&q=60")
  @user2 = User.create(username: "NoImDungeonDan", firstname: "Danny", lastname: "Darko", password: "issecurepassword", pic: "https://images.unsplash.com/photo-1519159554333-b9f467f9a7d7?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=b3d40679c8c2002845a05699535083cd&auto=format&fit=crop&w=800&q=60")
  @user3 = User.create(username: "xXmarksTheSpotXx", firstname: "Marcos", lastname: "Lopez", password: "issecurepassword", pic: "https://images.unsplash.com/photo-1525219659402-5d77cda79c06?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=b09276c55e1b12c0d8aca68855c5a040&auto=format&fit=crop&w=800&q=60")
  @user4 = User.create(username: "justschwick102", firstname: "John", lastname: "Schwick", password: "issecurepassword", pic: "https://images.unsplash.com/photo-1523586044048-b7d32d5da502?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=73f45ea50b44184d81a2de2e0bd67370&auto=format&fit=crop&w=800&q=60")
  @user5 = User.create(username: "test", firstname: "Jane", lastname: "Doe", password: "test", pic: "https://images.unsplash.com/photo-1504352244848-d22c20c5a602?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=44c1e98af80c1d2625cc66c7f42f0fc6&auto=format&fit=crop&w=500&q=60")
end

##### Seed demo characters to the DB #####
def make_demo_chars
  @char1 = Char.create(name: "Dirigible Wispus", user: @user1, klass: "Wizard", lvl: 13, school: "Abjuration", notes: "Big belly. Big brain. Little nubby fingers.")
  @char2 = Char.create(name: "Ilashi Dvorak", user: @user1, klass: "Sorceror", lvl: 12, school: "Fancy", notes: "Has nothing to say to commoners such as you.")
  @char3 = Char.create(name: "Iggy", user: @user2, klass: "Druid", lvl: 5, school: "Land", notes: "Is deaf in all animal forms. Thinks human are noisy anyways and does her best to avoid them.")
  @char4 = Char.create(name: "Vern", user: @user3, klass: "Bard", lvl: 4, school: "Lalala cant hear you", notes: "Wants things his way, and wants them now.")
  @char5 = Char.create(name: "Thok Hogswaddle", user: @user4, klass: "Paladin", lvl: 5, school: "did not attend", notes: "Thok is pure of heart and dumb of mind")
end


# Call dnd api and seed spells to DB
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
      lvl: json['level'],
      school: json['school']['name'],
      url: json['url'],
    )
    if spell.valid?
      spell.save
    end
  end
end

make_demo_users
make_demo_chars
# load_spells
