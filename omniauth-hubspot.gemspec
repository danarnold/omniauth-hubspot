# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-hubspot/version', __FILE__)

Gem::Specification.new do |gem|
  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'oauth2', '~> 0.9.0'

  gem.add_development_dependency 'rspec', '~> 2.7'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'webmock'
  gem.add_development_dependency 'simplecov'

  gem.authors       = ["Daniel Arnold"]
  gem.email         = ["darnold8@gmail.com"]
  gem.description   = %q{An abstract OAuth2 strategy for OmniAuth.}
  gem.summary       = %q{An abstract OAuth2 strategy for OmniAuth.}
  gem.homepage      = "https://github.com/danarnold/omniauth-hubspot"
  gem.license       = "MIT"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-oauth2"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::OAuth2::VERSION
end