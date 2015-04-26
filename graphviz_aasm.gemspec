# coding: utf-8
$:.push File.expand_path('../lib', __FILE__)
require 'graphviz_aasm/version'

Gem::Specification.new do |spec|
  spec.name          = "graphviz_aasm"
  spec.version       = GraphvizAasm::VERSION
  spec.authors       = ["Roman Trofimov"]
  spec.email         = ["trofimov.roman@gmail.com"]
  spec.summary       = %q{Use Ruby-GraphViz for AASM.}
  spec.description   = %q{This gem patches AASM to be able to generate graphs using GraphViz.}
  spec.homepage      = "https://github.com/romatr/graphviz_aasm"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.add_dependency "aasm", "~> 4.1"
  spec.add_dependency "activesupport"
  spec.add_dependency "railties"
  spec.add_dependency "ruby-graphviz"
end
