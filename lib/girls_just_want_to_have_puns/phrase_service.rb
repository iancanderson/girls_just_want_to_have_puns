require 'girls_just_want_to_have_puns/phrase_sources/wikipedia_beatles_songs_phrase_source'
require 'girls_just_want_to_have_puns/phrase_sources/wikipedia_best_selling_books_phrase_source'
require 'girls_just_want_to_have_puns/phrase_sources/wikipedia_idioms_phrase_source'
require 'girls_just_want_to_have_puns/phrase_sources/wikipedia_oscar_winning_films_phrase_source'
require 'girls_just_want_to_have_puns/phrase_sources/wikipedia_movie_quotes_phrase_source'

module GirlsJustWantToHavePuns
  class PhraseService

    def phrases
      self.class.sources.flat_map(&:phrases)
    end

    def self.refresh_sources(sources_to_exclude = [])
      (sources - sources_to_exclude).each(&:refresh)
    end

    def self.sources
      [
        WikipediaIdiomsPhraseSource, # page doesnt work any more
        WikipediaBeatlesSongsPhraseSource,
        WikipediaBestSellingBooksPhraseSource,
        WikipediaMovieQuotesPhraseSource,
        WikipediaOscarWinningFilmsPhraseSource,
      ]
    end

  end
end
