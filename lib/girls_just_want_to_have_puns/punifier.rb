require 'girls_just_want_to_have_puns/pun'

module GirlsJustWantToHavePuns
  class Punifier

    def initialize original_phrase, word_to_replace, replacement_word
      @original_phrase = original_phrase
      @word_to_replace = word_to_replace
      @replacement_word = replacement_word
    end

    def pun
      new_phrase = @original_phrase.text.sub(/\b#{@word_to_replace}/i, @replacement_word)
      if new_phrase == @original_phrase.text
        nil
      else
        Pun.new(new_phrase, @original_phrase.text, @original_phrase.category)
      end
    end

  end
end
