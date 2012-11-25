module GirlsJustWantToHavePuns
  class Pun

    attr_reader :category, :new_phrase, :original_phrase

    def initialize(new_phrase, original_phrase, category)
      @new_phrase = new_phrase
      @original_phrase = original_phrase
      @category = category
    end

  end
end
