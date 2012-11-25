require "girls_just_want_to_have_puns/version"
require "girls_just_want_to_have_puns/pun_generator"

module GirlsJustWantToHavePuns

  def self.puns(keyword)
    PunGenerator.puns(keyword)
  end

end
