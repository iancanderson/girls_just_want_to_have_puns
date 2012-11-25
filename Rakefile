require 'nokogiri'
require 'open-uri'

require './phrase_service'
require './punifier'
require './rhyme_service'

namespace :phrases do

  task :refresh do
    PhraseService.refresh_sources
  end

  task :exact do
    phrases = File.readlines('phrases.txt')
    matching_phrases = phrases.select do |phrase|
      phrase.include? ENV['keyword']
    end
    puts matching_phrases
  end

  task :similar do
    
    keyword = ENV['keyword']
    rhymes = RhymeService.new(keyword).rhymes
    phrases = PhraseService.new.phrases

    puts "RHYMES"
    puts rhymes.inspect
    puts

    phrases.each do |phrase|
      rhymes.each do |rhyme|
        pun = Punifier.new(phrase, rhyme, keyword).pun
        puts "#{pun} (#{phrase})" if pun
      end
    end

  end

end
