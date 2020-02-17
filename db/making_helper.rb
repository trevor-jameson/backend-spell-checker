require_relative 'loading_helper'

##### HELPER METHODS FOR API CALLS #####
def slot_checker(slot, json)
  if json['spellcasting']
    return json['spellcasting'][slot]
  else
    return 0
  end
end

def join_arr(item, space='')
  if item != nil
    return item.join(space)
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

##### METHODS FOR CALLING APIS #####

# Call and create a spell
def make_spell(spell_hash)
  response = RestClient.get('http://dnd5eapi.co' + spell_hash['url'])
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
      ritual: json['ritual'],
      duration: json['duration'],
      concentration: json['concentration'],
      klasses: select_classes(json['classes']),
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

# Create demo users
def make_demo_users
  @user1 = User.create(username: "ImDungeonDan", firstname: "Daniel", lastname: "Esperanto", password: "issecurepassword", pic: "https://images.unsplash.com/photo-1514036783265-fba9577fc473?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=72b5b878461033230d57ba8b7f4315ee&auto=format&fit=crop&w=800&q=60")
  @user2 = User.create(username: "NoImDungeonDan", firstname: "Danny", lastname: "Darko", password: "issecurepassword", pic: "https://images.unsplash.com/photo-1519159554333-b9f467f9a7d7?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=b3d40679c8c2002845a05699535083cd&auto=format&fit=crop&w=800&q=60")
  @user3 = User.create(username: "xXmarksTheSpotXx", firstname: "Marcos", lastname: "Lopez", password: "issecurepassword", pic: "https://images.unsplash.com/photo-1525219659402-5d77cda79c06?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=b09276c55e1b12c0d8aca68855c5a040&auto=format&fit=crop&w=800&q=60")
  @user4 = User.create(username: "justschwick102", firstname: "John", lastname: "Schwick", password: "issecurepassword", pic: "https://images.unsplash.com/photo-1523586044048-b7d32d5da502?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=73f45ea50b44184d81a2de2e0bd67370&auto=format&fit=crop&w=800&q=60")
  @user5 = User.create(username: "test", firstname: "Jane", lastname: "Doe", password: "test", pic: "https://images.unsplash.com/photo-1504352244848-d22c20c5a602?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=44c1e98af80c1d2625cc66c7f42f0fc6&auto=format&fit=crop&w=500&q=60")
end

# Create demo characters, assigned to users
def make_demo_chars
  @char1 = Char.create(name: "Dirigible Wispus", health: 10, user: User.find(1),  notes: "Big belly. Big brain. Little nubby fingers.")
  @char2 = Char.create(name: "Ilashi Dvorak", health: 15, user: User.find(2), notes: "Has nothing to say to commoners such as you.")
  @char3 = Char.create(name: "Iggy", health: 44, user: User.find(5), notes: "Is deaf in all animal forms. Thinks humans are noisy anyways and does her best to avoid them.")
  @char4 = Char.create(name: "Firak Slowflame", health: 25, user: User.find(5), notes: "Patient. Poetic. Wise beyond his 15 years")
  @char5 = Char.create(name: "Biggie Hogswaddle", health: 30, user: User.find(5), notes: "Bigs is pure of heart and dumb of mind")
  @char6 = Char.create(name: "Rogar", health: 86, user: User.find(5), notes: "Huge friendly scaly hungry lizard person")
  @char7 = Char.create(name: "Ash Ketchum", health: 48, user: User.find(5), notes: "Gotta catch em all!")
end

# Create demo abilities, assigned to characters
def make_demo_abilities
  @ab1 = AbilitiesSet.create(str: 15, dex: 10, con: 9, int: 14, wis: 18, cha: 8, char: Char.find(1))
  @ab2 = AbilitiesSet.create(str: 11, dex: 7, con: 14, int: 14, wis: 11, cha: 11, char: Char.find(2))
  @ab3 = AbilitiesSet.create(str: 8, dex: 16, con: 18, int: 9, wis: 13, cha: 10, char: Char.find(3))
  @ab4 = AbilitiesSet.create(str: 16, dex: 10, con: 13, int: 16, wis: 5, cha: 20, char: Char.find(4))
  @ab5 = AbilitiesSet.create(str: 18, dex: 8, con: 12, int: 10, wis: 6, cha: 9, char: Char.find(5))
end

def make_demo_known_spells
  @ks1 = KnownSpell.create(char: Char.find(1), spell: Spell.find(319))
  @ks2 = KnownSpell.create(char: Char.find(1), spell: Spell.find(88))
  @ks3 = KnownSpell.create(char: Char.find(2), spell: Spell.find(72))
  @ks4 = KnownSpell.create(char: Char.find(2), spell: Spell.find(100))
  @ks5 = KnownSpell.create(char: Char.find(3), spell: Spell.find(102))
  @ks6 = KnownSpell.create(char: Char.find(3), spell: Spell.find(219))
  @ks7 = KnownSpell.create(char: Char.find(4), spell: Spell.find(300))
  @ks8 = KnownSpell.create(char: Char.find(4), spell: Spell.find(12))
  @ks9 = KnownSpell.create(char: Char.find(5), spell: Spell.find(18))
  @ks10 = KnownSpell.create(char: Char.find(5), spell: Spell.find(56))
  @ks11 = KnownSpell.create(char: Char.find(6), spell: Spell.find(319))
  @ks12 = KnownSpell.create(char: Char.find(6), spell: Spell.find(88))
  @ks13 = KnownSpell.create(char: Char.find(7), spell: Spell.find(72))
  @ks14 = KnownSpell.create(char: Char.find(7), spell: Spell.find(100))
end

def make_demo_char_klasses
  @ck1 = CharKlass.create(char: Char.find(1), klass: Klass.find(1), klass_lvl: 4)
  @ck2 = CharKlass.create(char: Char.find(2), klass: Klass.find(2), klass_lvl: 15)
  @ck3 = CharKlass.create(char: Char.find(3), klass: Klass.find(3), klass_lvl: 5)
  @ck4 = CharKlass.create(char: Char.find(4), klass: Klass.find(4), klass_lvl: 5)
  @ck5 = CharKlass.create(char: Char.find(5), klass: Klass.find(12), klass_lvl: 7)
  @ck1 = CharKlass.create(char: Char.find(6), klass: Klass.find(1), klass_lvl: 4)
  @ck2 = CharKlass.create(char: Char.find(7), klass: Klass.find(2), klass_lvl: 15)
end

# Call and create a klass, then call and create each level for that klass
def make_klass(klass_hash)
  response = RestClient.get('http://dnd5eapi.co' + klass_hash['url'])
  json = JSON.parse(response)

  if json != nil
    klass = Klass.new(
      api_id: json['_id'],
      name: json['name'],
      hitdie: json['hit_die']
    )
    if klass.valid?
      klass.save
      load_klass_levels(klass.name)
    end
  end
end

# Call and create a klass_level
def make_klass_level(klass_name, level_counter)
  response = RestClient.get('http://dnd5eapi.co/api/classes/' + klass_name.downcase + '/levels/' + level_counter.to_s)
  json = JSON.parse(response)

  if json != nil
    # cannot call [] on nil, will error out for non-spellcasters

    klass_level = KlassLevel.new(
      klass: Klass.find_by(name: klass_name),
      level: level_counter,
      spellscanknow: slot_checker('spells_known', json),
      slot0: slot_checker('cantrips_known', json),
      slot1: slot_checker('spell_slots_level_1', json),
      slot2: slot_checker('spell_slots_level_2', json),
      slot3: slot_checker('spell_slots_level_3', json),
      slot4: slot_checker('spell_slots_level_4', json),
      slot5: slot_checker('spell_slots_level_5', json),
      slot6: slot_checker('spell_slots_level_6', json),
      slot7: slot_checker('spell_slots_level_7', json),
      slot8: slot_checker('spell_slots_level_8', json),
      slot9: slot_checker('spell_slots_level_9', json),
    )
    if klass_level.valid?
      klass_level.save
    end
  end
end
