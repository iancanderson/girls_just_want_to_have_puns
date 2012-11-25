#!/usr/bin/env rake
require "bundler/gem_tasks"

require 'nokogiri'
require 'open-uri'

require './lib/girls_just_want_to_have_puns/phrase_service'

namespace :phrases do

  task :refresh do
    PhraseService.refresh_sources
  end

end
