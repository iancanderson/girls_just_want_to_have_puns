module GirlsJustWantToHavePuns
  class Pun

    attr_reader :new_phrase, :original_phrase

    def initialize(new_phrase, original_phrase)
      @new_phrase = new_phrase
      @original_phrase = original_phrase
    end

  end
end
