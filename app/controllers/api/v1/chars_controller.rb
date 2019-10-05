class Api::V1::CharsController < ApplicationController

  # User_id sent seperately in JWT
  # form = {
  #   char: {
  #     name: '',
  #     notes: '',
  #     health: 0,
  #     ab: {
  #       str: 0,
  #       dex: 0,
  #       con: 0,
  #       int: 0,
  #       wis: 0,
  #       cha: 0
  #     },
  #     klasses: {
  #       name: '',
  #       id: 0,
  #       hitdie: 0
  #     },
  #     known_spells: [0, 1, 2, 319, 58],
  #     slots: {
  #       cant: 3,
  #       slot1: 4,
  #       slot2: 3,
  #       slot3: 2
  #     }
  #   }
  # }
  def index
    byebug
    @chars = Char.where(user: current_user)
    render json: {chars: @chars, sheet: Char.first.char_sheet[0]}
  end

    def create
      # How will current_user work here?
      @char = Char.create(new_user_params, user: current_user)
      @ab_set = AbilitiesSet.create(ab_params, char: @char)
      @char_klass = CharKlass.create(char: @char, klass_lvl: char_klass_params[:level] ,klass: Klass.find_by(name: char_klass_params[:char][:class]))
    end

private

  # Cannot have unpermitted params after required key
  def new_char_params
    params.require(:char).permit(:name, :pic, :health, :notes)
  end

  def ab_params
    params.require(:char).permit(:abilities)
  end

  def char_klass_params
    params.require(:char).permit(:class, :level)
  end

end
