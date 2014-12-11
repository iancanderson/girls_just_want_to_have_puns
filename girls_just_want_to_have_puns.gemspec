# -*- encoding: utf-8 -*-
require File.expand_path('../lib/girls_just_want_to_have_puns/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Ian C. Anderson"]
  gem.email         = ["anderson.ian.c@gmail.com"]
  gem.description   = %q{Generate puns by incorporating a keyword into a phrase.}
  gem.summary       = %q{Generate puns by incorporating a keyword into a phrase.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "girls_just_want_to_have_puns"
  gem.require_paths = ["lib"]
  gem.version       = GirlsJustWantToHavePuns::VERSION
  gem.add_dependency('nokogiri', '>= 1.5.5')
  gem.add_development_dependency('rake')
end
