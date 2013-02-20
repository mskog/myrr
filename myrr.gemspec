# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'myrr/version'

Gem::Specification.new do |gem|
  gem.name          = "myrr"
  gem.version       = Myrr::VERSION
  gem.authors       = ["Magnus Skog"]
  gem.email         = ["magnus.m.skog@gmail.com"]
  gem.description   = "A Ruby client for the Myrrix recommendation engine"
  gem.summary       = "A Ruby style client for the Myrrix recommendation engine. Leverages Ruby instead of having to mess around with CSV data and such"
  gem.homepage      = "https://github.com/mskog/myrr"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'guard'
  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'webmock'
  gem.add_development_dependency 'ci_reporter'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'simplecov-rcov'

  gem.add_development_dependency 'rb-inotify'

  gem.add_runtime_dependency 'faraday'
  gem.add_runtime_dependency 'faraday_middleware'
end
