lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'bancard-redpanda'
  spec.version       = '1.0.0'
  spec.platform      = Gem::Platform::RUBY
  spec.authors       = ['Felipe Fava, Matteo Guerrieri']
  spec.email         = %W[bancard@moove-it.com]
  spec.summary       = 'Common loggers used on bancard projects.'
  spec.description   = <<-DESCRIPTION
    Provides a set of loggers to use in bancard projects.
  DESCRIPTION
  spec.license       = 'MIT'

  spec.files         = Dir.glob('{lib}/**/*')
  spec.test_files    = Dir.glob('{spec/bancard}/**/*')
  spec.require_paths = %W[lib]

  spec.add_development_dependency('rake')
  spec.add_development_dependency('rspec')
  # spec.add_development_dependency('ci_reporter')
end