# -*- encoding: utf-8 -*-
require File.expand_path('../lib/yammer_api/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Magdalena Sikorska"]
  gem.email         = ["madzia.sikorska@gmail.com"]
  gem.description   = %q{Ruby wrapper for Yammer API, using OAuth 2.0}
  gem.summary       = gem.summary
  gem.homepage      = "https://github.com/elrosa/yammer_api"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "yammer_api"
  gem.require_paths = ["lib"]
  gem.version       = YammerApi::VERSION

  gem.add_dependency 'hashie', '~> 1.2.0'
  gem.add_dependency 'multi_json', '~> 1.0.3'
  gem.add_dependency 'omniauth-oauth2', '~> 1.0.0'

  gem.add_development_dependency 'json', '~> 1.6'
  gem.add_development_dependency 'rake', '~> 0.9'
  gem.add_development_dependency 'rdoc', '~> 3.8'
  gem.add_development_dependency 'rspec', '~> 2.6'
  gem.add_development_dependency 'webmock', '~> 1.7'

end
