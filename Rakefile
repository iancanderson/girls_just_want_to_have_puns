#!/usr/bin/env rake
require "bundler/gem_tasks"

require 'girls_just_want_to_have_puns/phrase_service'

namespace :phrases do

  task :refresh do
    GirlsJustWantToHavePuns::PhraseService.refresh_sources
  end

end
