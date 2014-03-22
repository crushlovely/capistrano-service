# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'capistrano-service'
  spec.version       = '0.0.1'
  spec.authors       = ['PJ Kelly']
  spec.email         = ['pj@crushlovely.com']
  spec.description   = %q{Cleanly manage your Linux services with Capistrano 3.x}
  spec.summary       = %q{Cleanly manage your Linux services with Capistrano 3.x}
  spec.homepage      = 'https://github.com/crushlovely/capistrano-service'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'capistrano', '>= 3.0.0.pre'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
