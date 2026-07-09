# frozen_string_literal: true

source 'https://rubygems.org'

# Specify your gem's dependencies in .gemspec
# gemspec

# Needed for the CLI only
group :runtime, :cli do
  gem 'docopt', '~> 0.6' # for argument parsing
end

# Needed for the CLI & library
group :runtime, :all do
  # no external dependency yet
end

# Needed to install dependencies
group :development, :install do
  gem 'bundler', '~> 4.0'
end

# Needed to run tests
group :development, :test do
  gem 'minitest', '~> 6.0'
  gem 'rake', '~> 13.3'
end

# Needed for linting
group :development, :lint do
  gem 'rubocop', '~> 1.82'
end

group :development, :docs do
  gem 'commonmarker', '~> 2.8' # for markdown support in YARD
  gem 'irb' # https://github.com/lsegal/yard/issues/1636
  gem 'logger' # https://github.com/lsegal/yard/issues/1636
  gem 'ostruct' # https://github.com/lsegal/yard/issues/1636
  gem 'webrick', '~> 1.9' # for yard server
  gem 'yard', ['>= 0.9.43', '< 0.10']
  # https://github.com/lsegal/yard/issues/1528
  # gem 'yard', github: 'ParadoxV5/yard', ref: '9e869c940859570b07b81c5eadd6070e76f6291e', branch: 'commonmarker-1.0'
  gem 'yard-coderay', '~> 0.1' # for syntax highlight support in YARD
end
