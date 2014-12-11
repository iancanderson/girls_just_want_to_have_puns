require 'girls_just_want_to_have_puns/phrase_service'
require 'girls_just_want_to_have_puns/punifier'
require 'girls_just_want_to_have_puns/rhyme_service'

module GirlsJustWantToHavePuns
  class PunGenerator
    def initialize(keyword, rhymes: nil, source_phrases: nil)
      @keyword = keyword
      @rhymes = rhymes || load_rhymes(keyword)
      @source_phrases = source_phrases || load_source_phrases
    end

    def puns
      puns = []
      @source_phrases.each do |phrase|
        @rhymes.each do |rhyme|
          puns << Punifier.new(phrase, rhyme, @keyword).pun
        end
      end
      puns.compact
    end

    private

    def load_rhymes(keyword)
      RhymeService.new(keyword).rhymes
    end

    def load_source_phrases
      PhraseService.new.phrases
    end
  end
end
