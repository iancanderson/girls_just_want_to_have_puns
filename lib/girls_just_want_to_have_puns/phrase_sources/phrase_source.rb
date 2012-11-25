require 'girls_just_want_to_have_puns/phrase'

module GirlsJustWantToHavePuns

  class PhraseSource

    def self.phrases
      File.readlines(cache_filepath).map(&:chomp).map do |phrase|
        Phrase.new(friendly_name, phrase)
      end
    end

    def self.phrase_directory
      'phrases'
    end

  end

end
