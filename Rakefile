#!/usr/bin/env rake
require "rubygems"
require "bundler/setup"
require "bundler/gem_tasks"
require "girls_just_want_to_have_puns"

namespace :phrases do

  task :refresh do
    GirlsJustWantToHavePuns::PhraseService.refresh_sources
  end

end
