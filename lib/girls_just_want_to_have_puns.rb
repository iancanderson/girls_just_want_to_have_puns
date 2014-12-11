require "girls_just_want_to_have_puns/version"
require "girls_just_want_to_have_puns/pun_generator"

module GirlsJustWantToHavePuns

  def self.pun(keyword, rhymes: nil, source_phrases: nil)
    PunGenerator.new(keyword, rhymes: rhymes, source_phrases: source_phrases).pun
  end

  def self.puns(keyword, rhymes: nil, source_phrases: nil)
    PunGenerator.new(keyword, rhymes: rhymes, source_phrases: source_phrases).puns
  end

end
