require 'nokogiri'
require 'open-uri'

require 'girls_just_want_to_have_puns/phrase_sources/phrase_source'

module GirlsJustWantToHavePuns
  class WikipediaBeatlesSongsPhraseSource < PhraseSource

    def self.refresh
      doc = Nokogiri::HTML(open('http://en.wikipedia.org/wiki/List_of_songs_recorded_by_the_Beatles'))

      songs = doc.css('#mw-content-text table.wikitable tr td:first-child a').map do |song|
        song.content
      end

      Dir.mkdir(phrase_directory) unless Dir.exists? phrase_directory
      File.open(cache_filepath, 'w') do |phrases_file|
        phrases_file.write(songs.join("\n")) if songs.any?
      end
    end

    def self.cache_filepath
      File.expand_path(File.join(File.dirname(__FILE__), "../", phrase_directory, "beatles_songs.txt"))
    end

    def self.friendly_name
      'Beatles songs'
    end

  end
end

