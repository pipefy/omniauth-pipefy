# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/pipefy/version'

Gem::Specification.new do |spec|
  spec.name          = 'omniauth-pipefy'
  spec.version       = Omniauth::Pipefy::VERSION
  spec.authors       = ['Marcio Trindade']
  spec.email         = ['marciotrindade@gmail.com']

  spec.summary       = 'OmniAuth strategy for Pipefy'
  spec.description   = 'OmniAuth strategy for Pipefy'
  spec.homepage      = 'https://github.com/pipefy/omniauth-pipefy'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'omniauth-oauth2', '~> 1.4'

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'simplecov', '~> 0.13.0'
  spec.add_development_dependency 'pry', '~> 0.10'
end
