require 'nokogiri'
require 'open-uri'

require 'girls_just_want_to_have_puns/phrase_sources/phrase_source'

module GirlsJustWantToHavePuns
  class WikipediaMovieQuotesPhraseSource < PhraseSource
    def self.refresh
      doc = Nokogiri::HTML(open(wikipedia_url))

      songs = doc.css('#mw-content-text table.wikitable tr td:nth-child(2)').map do |song|
        song.content
      end

      Dir.mkdir(phrase_directory) unless Dir.exists? phrase_directory
      File.open(cache_filepath, 'w') do |phrases_file|
        phrases_file.write(songs.join("\n")) if songs.any?
      end
    end

    def self.cache_filepath
      File.expand_path(File.join(File.dirname(__FILE__), "../", phrase_directory, "#{friendly_name.downcase.gsub(/\s/, '-')}.txt"))
    end

    def self.wikipedia_url
      "https://en.wikipedia.org/wiki/AFI's_100_Years...100_Movie_Quotes"
    end

    def self.friendly_name
      'Movie quotes'
    end
  end
end

