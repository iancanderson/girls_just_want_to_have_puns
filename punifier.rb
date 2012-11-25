class Punifier

  def initialize original_phrase, word_to_replace, replacement_word
    @original_phrase = original_phrase
    @word_to_replace = word_to_replace
    @replacement_word = replacement_word
  end

  def pun
    pun = @original_phrase.sub(/\b#{@word_to_replace}/, @replacement_word)
    pun == @original_phrase ? nil : pun
  end

end
