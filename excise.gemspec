# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'excise/version'

Gem::Specification.new do |gem|
  gem.name          = "excise"
  gem.version       = Excise::VERSION
  gem.authors       = ["Ezekiel Templin"]
  gem.email         = ["zeke@templ.in"]
  gem.description   = %q{Excise is a Ruby port of extract-values}
  gem.summary       = %q{Excise is a Ruby port of extract-values}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep('spec')
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec', '~> 2.11.0'
end
