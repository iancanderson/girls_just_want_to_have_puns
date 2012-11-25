require 'json'
require 'open-uri'

class RhymeService

  def initialize keyword
    @keyword = keyword
  end

  def rhymes
    rhyme_hashes = JSON.parse(fetch_rhymes)
    max_score = rhyme_hashes.max_by { |r| r['score'] }['score']

    rhyme_hashes.select do |r|
      r['score'] == max_score
    end.map do |rhyme|
      rhyme['word']
    end
  end

  private

  def fetch_rhymes
    open("http://rhymebrain.com/talk?function=getRhymes&word=#{@keyword}&maxResults=0&lang=en").read
  end

end
