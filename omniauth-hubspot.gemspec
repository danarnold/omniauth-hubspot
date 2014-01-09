# # -*- encoding: utf-8 -*-
# require File.expand_path('../lib/omniauth/hubspot/version', __FILE__)

# Gem::Specification.new do |gem|
#   gem.add_dependency 'omniauth'
#   gem.add_dependency 'oauth2'
#   gem.add_dependency 'omniauth-oauth2'

#   gem.add_development_dependency 'rspec', '~> 2.7'
#   gem.add_development_dependency 'rack-test'
#   gem.add_development_dependency 'webmock'
#   gem.add_development_dependency 'simplecov'

#   gem.authors       = ["Daniel Arnold"]
#   gem.email         = ["darnold8@gmail.com"]
#   gem.description   = %q{An OmniAuth strategy for authenticating with the HubSpot API.}
#   gem.summary       = %q{OmniAuth strategy for authenticating with HubSpot.}
#   gem.homepage      = "https://github.com/danarnold/omniauth-hubspot"
#   gem.license       = "GPL v3"

#   gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
#   gem.files         = `git ls-files`.split("\n")
#   gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
#   gem.name          = "omniauth-hubspot"
#   gem.require_paths = ["lib"]
#   gem.version       = OmniAuth::HubSpot::VERSION
# end

# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'omniauth/hubspot/version'

Gem::Specification.new do |s|
  s.name          = 'omniauth-hubspot'
  s.version       = OmniAuth::HubSpot::VERSION
  s.platform      = Gem::Platform::RUBY
  s.author        = 'Daniel Arnold'
  s.email         = ['darnold8@gmail.com']
  s.summary       = 'OmniAuth strategy for authenticating with HubSpot.'
  s.description   = 'An OmniAuth strategy for authenticating with the HubSpot API.'
  s.homepage      = 'https://github.com/danarnold/omniauth-hubspot/'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency 'omniauth-oauth2'
  s.add_development_dependency 'rack-test'
  s.add_development_dependency 'rake'
end
