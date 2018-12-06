require 'rest-client'
require 'json'
require 'byebug'
require_relative './loading_helper.rb'
require_relative './making_helper.rb'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

#### STEPS FOR A HAPPY, HEALTHY DATABASE ####
# TODO: UPDATE THESE STEPS ONCE API PARSING IS FULLY-FUNCTIONAL
# 1) Destroy all previous data
# 2) Create demo users
# 3) Call count of total spells from 5eAPI
# 4) Load all spell data from 5eAPI
# 5) Create levels 1-20
# 6) Load all klass data from 5eAPI
# 6a) Foreach klass, iterate through all 20 levels, creating klass_level
# 7) Load all demo chars
#


## The order of destruction must be maintained to avoid violating the foreign key dependencies
# NOTE: These destroyers could be moved to the top of the making_helper methods once DB testing is completed
# KlassLevel.destroy_all
# AbilitiesSet.destroy_all
# Klass.destroy_all
# CharKlass.destroy_all
# KnownSpell.destroy_all
# Spell.destroy_all
# Char.destroy_all
# User.destroy_all



# Users and characters must be created first, other tables depend on them
make_demo_users
make_demo_chars
make_demo_abilities
load_spells
make_demo_known_spells
load_klasses
make_demo_char_klasses
