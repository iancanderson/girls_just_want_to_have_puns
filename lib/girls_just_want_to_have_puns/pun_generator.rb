require 'girls_just_want_to_have_puns/phrase_service'
require 'girls_just_want_to_have_puns/punifier'
require 'girls_just_want_to_have_puns/rhyme_service'

module GirlsJustWantToHavePuns
  class PunGenerator
    def initialize(keyword, minimum_word_count: nil, rhymes: nil, source_phrases: nil)
      @keyword = keyword
      @minimum_word_count = minimum_word_count
      @rhymes = rhymes || load_rhymes(keyword)
      @source_phrases = source_phrases || load_source_phrases
    end

    def puns
      @source_phrases.each_with_object([]) do |phrase, puns|
        @rhymes.each do |rhyme|
          if pun = Punifier.new(phrase, rhyme, @keyword).pun
            puns << pun if valid_pun?(pun)
          end
        end
      end
    end

    def pun
      @source_phrases.shuffle.each do |phrase|
        @rhymes.shuffle.each do |rhyme|
          if pun = Punifier.new(phrase, rhyme, @keyword).pun
            return pun if valid_pun?(pun)
          end
        end
      end
      return nil
    end

    private

    def load_rhymes(keyword)
      RhymeService.new(keyword).rhymes
    end

    def load_source_phrases
      PhraseService.new.phrases
    end

    def valid_pun?(pun)
      return true unless @minimum_word_count
      @minimum_word_count < pun.new_phrase.split(" ").size
    end
  end
end
