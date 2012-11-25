require 'girls_just_want_to_have_puns/pun'

module GirlsJustWantToHavePuns
  class Punifier

    def initialize original_phrase, word_to_replace, replacement_word
      @original_phrase = original_phrase
      @word_to_replace = word_to_replace
      @replacement_word = replacement_word
    end

    def pun
      new_phrase = @original_phrase.sub(/\b#{@word_to_replace}/, @replacement_word)
      if new_phrase == @original_phrase
        nil
      else
        Pun.new(new_phrase, @original_phrase)
      end
    end

  end
end
