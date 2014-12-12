require 'nokogiri'
require 'open-uri'

require 'girls_just_want_to_have_puns/phrase_sources/phrase_source'

module GirlsJustWantToHavePuns
  class WikipediaOscarWinningFilmsPhraseSource < PhraseSource

    def self.refresh
      doc = Nokogiri::HTML(open('http://en.wikipedia.org/wiki/List_of_Academy_Award-winning_films'))

      songs = doc.css('#mw-content-text table.wikitable tr td:first-child a').map do |song|
        song.content
      end

      Dir.mkdir(phrase_directory) unless Dir.exists? phrase_directory
      File.open(cache_filepath, 'w') do |phrases_file|
        phrases_file.write(songs.join("\n")) if songs.any?
      end
    end

    def self.cache_filepath
      File.expand_path(File.join(File.dirname(__FILE__), "../", phrase_directory, "oscar_winning_movies.txt"))
    end

    def self.friendly_name
      'Oscar-winning movies'
    end

  end
end

