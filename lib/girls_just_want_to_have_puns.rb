require "girls_just_want_to_have_puns/version"
require "girls_just_want_to_have_puns/pun_generator"

module GirlsJustWantToHavePuns

  def self.pun(keyword, options = {})
    PunGenerator.new(keyword, options).pun
  end

  def self.puns(keyword, options = {})
    PunGenerator.new(keyword, options).puns
  end

end
