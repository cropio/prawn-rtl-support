# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'prawn/rtl/support/version'

Gem::Specification.new do |spec|
  spec.name          = "prawn-rtl-support"
  spec.version       = Prawn::Rtl::Support::VERSION
  spec.authors       = ["Oleksandr Lapchenko"]
  spec.email         = ["ozeron@me.com"]

  spec.summary       = 'Gem which patch prawn to provide support of arabic language.'
  spec.description   = 'Add suport for arabic language in prawn. '
  spec.homepage      = "https://github.com/cropio/prawn-rtl-support"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_development_dependency "rubocop", "~> 0.48"
  spec.add_dependency "prawn", "~> 2.2"
  spec.add_dependency "twitter_cldr", "~> 4.3"
end
