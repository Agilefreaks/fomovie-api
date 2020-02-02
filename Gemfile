# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'rake'

# Web framework
gem 'dry-system'
gem 'dry-web'
gem 'dry-web-roda'
gem 'puma'
gem 'rack_csrf'

gem 'rack', '>= 2.0'

group :development, :test do
  gem 'pry-byebug', platform: :mri
end

group :development do
  gem 'rerun'
  gem 'rubocop'
end

group :test do
  gem 'rspec'
end
