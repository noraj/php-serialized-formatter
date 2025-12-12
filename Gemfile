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
  gem 'bundler', '~> 2.1'
end

# Needed to run tests
group :development, :test do
  gem 'minitest', '~> 5.27'
  gem 'rake', '~> 13.3'
end

# Needed for linting
group :development, :lint do
  gem 'rubocop', '~> 1.81'
end

group :development, :docs do
  # https://github.com/lsegal/yard/issues/1528
  # gem 'yard', github: 'ParadoxV5/yard', ref: '9e869c940859570b07b81c5eadd6070e76f6291e', branch: 'commonmarker-1.0'
  # gem 'commonmarker', '~> 2.0' # for markdown support in YARD

  gem 'alembic-jekyll-theme', '~> 4.1' # jekyll theme
  gem 'commonmarker', '~> 0.23' # for markdown support in YARD
  gem 'jekyll', '~> 4.4', '>= 4.4.1' # user documentation
  gem 'jekyll-commonmark', '~> 1.3' # jekyll markdown plugin
  gem 'jekyll-default-layout', '~> 0.1.5' # jekyll plugin that set default layout automatically
  gem 'jekyll-optional-front-matter', '~> 0.3.2' # jekyll plugin so that YAML frontmatter are optionnals
  gem 'jekyll-readme-index', '~> 0.3.0' # jekyll plugin so that README.md becomes the index
  gem 'jekyll-seo-tag', '~> 2.6' # jekyll seo plugin
  gem 'webrick', '~> 1.9' # for yard server
  gem 'yard', ['>= 0.9.37', '< 0.10'] # library documentation
  gem 'yard-coderay', '~> 0.1' # for syntax highlight support in YARD
end
