require 'girls_just_want_to_have_puns/phrase_sources/wikipedia_beatles_songs_phrase_source'
require 'girls_just_want_to_have_puns/phrase_sources/wikipedia_idioms_phrase_source'

module GirlsJustWantToHavePuns
  class PhraseService

    def phrases
      self.class.sources.map(&:phrases).flatten
    end

    def self.refresh_sources
      sources.each(&:refresh)
    end

    def self.sources
      [WikipediaIdiomsPhraseSource, WikipediaBeatlesSongsPhraseSource]
    end

  end
end
