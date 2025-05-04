# frozen_string_literal: true

require_relative 'lib/psf/version'

Gem::Specification.new do |s|
  s.name          = 'php-serialized-formatter'
  s.version       = Psf::VERSION
  s.platform      = Gem::Platform::RUBY
  s.summary       = 'Serialize and unserialize to|from PHP session|objects.'
  s.description   = "PHP serialization library that can parse and generate PHP's"
  s.description  += 'serialization format including PHP sessions specific format.'
  s.authors       = ['Alexandre ZANNI']
  s.email         = 'alexandre.zanni@europe.com'
  s.homepage      = 'https://github.com/noraj/php-serialized-formatter'
  s.license       = 'MIT'

  s.files         = Dir['bin/*', 'lib/**/*.rb', 'LICENSE']
  s.bindir        = 'bin'
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.metadata = {
    'yard.run'              => 'yard',
    'bug_tracker_uri'       => 'https://github.com/noraj/php-serialized-formatter/issues',
    'changelog_uri'         => 'https://github.com/noraj/php-serialized-formatter/releases',
    'documentation_uri'     => 'https://noraj.github.io/php-serialized-formatter/',
    'homepage_uri'          => 'https://github.com/noraj/php-serialized-formatter',
    'source_code_uri'       => 'https://github.com/noraj/php-serialized-formatter/',
    'rubygems_mfa_required' => 'true'
  }

  s.required_ruby_version = ['>= 3.1.0', '< 4.0']
end
