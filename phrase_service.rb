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
