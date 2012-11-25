class WikipediaIdiomsPhraseSource

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

  def self.phrase_directory
    'phrases'
  end

  def self.cache_filepath
    "./#{phrase_directory}/wikipedia_idioms.txt"
  end

  def self.phrases
    File.readlines(cache_filepath).map(&:chomp)
  end

end

class PhraseService

  def phrases
    self.class.sources.map(&:phrases).flatten
  end

  def self.refresh_sources
    sources.each(&:refresh)
  end

  def self.sources
    [WikipediaIdiomsPhraseSource]
  end

end
