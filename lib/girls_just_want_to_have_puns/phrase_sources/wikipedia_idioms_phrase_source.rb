require 'nokogiri'
require 'open-uri'

require 'girls_just_want_to_have_puns/phrase_sources/phrase_source'

module GirlsJustWantToHavePuns
  class WikipediaIdiomsPhraseSource < PhraseSource

    def self.refresh
      doc = Nokogiri::HTML(open('http://en.wiktionary.org/wiki/Appendix:English_idioms'))

      idioms = doc.css('#mw-content-text div div table tr td ul li a').map do |idiom|
        idiom.content
      end

      Dir.mkdir(phrase_directory) unless Dir.exists? phrase_directory
      File.open(cache_filepath, 'w') do |phrases_file|
        phrases_file.write(idioms.join("\n")) if idioms.any?
      end
    end

    def self.cache_filepath
      File.expand_path(File.join(File.dirname(__FILE__), "../", phrase_directory, "wikipedia_idioms.txt"))
    end

    def self.friendly_name
      'English idioms'
    end

  end
end
