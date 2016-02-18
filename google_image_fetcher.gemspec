# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'google_image_fetcher/version'

Gem::Specification.new do |spec|
  spec.name          = "google_image_fetcher"
  spec.version       = GoogleImageFetcher::VERSION
  spec.authors       = ["ryonext"]
  spec.email         = ["ryonext.s@gmail.com"]

  spec.summary       = %q{Fetch images from Google by your search query}
  spec.homepage      = "https://github.com/ryonext/google_image_fetcher_ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = "google_image"
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday"
  spec.add_dependency "thor"
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry-byebug"
end
