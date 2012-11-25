require 'girls_just_want_to_have_puns/phrase_service'
require 'girls_just_want_to_have_puns/punifier'
require 'girls_just_want_to_have_puns/rhyme_service'

module GirlsJustWantToHavePuns
  class PunGenerator

    def self.puns(keyword)
      rhymes = RhymeService.new(keyword).rhymes
      phrases = PhraseService.new.phrases

      puns = []

      phrases.each do |phrase|
        rhymes.each do |rhyme|
          puns << Punifier.new(phrase, rhyme, keyword).pun
        end
      end

      puns.compact
    end

  end
end
