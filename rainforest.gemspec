$:.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'rainforest/version'

spec = Gem::Specification.new do |s|
  s.name = 'rainforest'
  s.summary = 'Ruby bindings for Rainforest API'
  s.description = 'Rainforest automates your functional and integration testing with our QA-as-a-Service API.'
  s.homepage = 'https://docs.rainforestqa.com'
  s.authors = ['Apibits.com']
  s.email = ['libraries@apibits.com']
  s.version = Rainforest::VERSION
  s.license = 'MIT'

  s.add_dependency('rest-client', '~> 1.4')
  s.add_dependency('mime-types', '>= 1.25', '< 3.0')
  s.add_dependency('json', '~> 1.8.1')

  s.add_development_dependency('mocha', '~> 0.13.2')
  s.add_development_dependency('shoulda', '~> 3.4.0')
  s.add_development_dependency('test-unit')
  s.add_development_dependency('rake')

  s.files = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- test/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
end

